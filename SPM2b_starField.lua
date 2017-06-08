package.path = package.path .. ";" .. "/home/savanna/Projects/AFRL/OpenPV/parameterWrapper/?.lua"; local pv = require "PVModule";

local inputWidth            = 256;
local inputHeight           = 256;
local inputFeatures         = 1;
local nonConvFlag           = true;
local nonConvHeight         = 1/4;
local tiers                 = 4;
local stride                = {};
for i_tier = 1, tiers do
   stride[i_tier]           = math.pow(2, i_tier-1+1);
end
if nonConvFlag then
   stride[tiers]            = inputHeight*nonConvHeight;
end
patchSize                   = {};
patchSize[1]                = 10; --9; --5;
for i_tier = 2, tiers do
   patchSize[i_tier]        = 1+patchSize[1]/stride[1];
end
if nonConvFlag then
   patchSize[tiers]         = stride[tiers]/stride[tiers-1];
end
local patchSizeATA          = {};
for i_tier = 1, tiers do
   patchSizeATA[i_tier]     = patchSize[1]*math.pow(2,i_tier-1);
   if patchSizeATA[i_tier]  > inputHeight then
      patchSizeATA[i_tier]  = inputHeight
   end
end
if nonConvFlag then
      patchSizeATA[tiers]   = inputHeight * nonConvHeight;
end
local temporalStride        = {};
temporalStride[1]           = 1
for i_tier = 2, tiers do
   temporalStride[i_tier]   = 1; --temporalStride[1]*math.pow(2,i_tier-2);
end
local temporalSize          = {};   -- in units of frames
temporalSize[1]             = 3;
for i_tier = 2, tiers do
   --temporalSize[i_tier]     = temporalSize[1] * math.pow(2,i_tier-1);
   temporalSize[i_tier]     = temporalSize[i_tier-1] + 1*temporalStride[i_tier-1];
end
local temporalSizeATA       = temporalSize;
local numFrames             = temporalSize[tiers] + 2*temporalStride[tiers]; --8;

local nbatch                = 2;      --Batch size
local batchwidth            = 1;
local startFrame            = 1;
local skipFrame             = 1; --*numFrames*nbatch;

local sizeFactor            = 1/2; -- 1/2 gives constant computational complexity if temporalStride == 1
local sizeBase              = 2*2*1; -- overcompleteness * rectification * RGB
local dictionarySize        = {};
dictionarySize[1]           = sizeBase*stride[1]*stride[1];
for i_tier = 2, tiers do
   dictionarySize[i_tier]   = sizeBase*math.pow(sizeFactor,i_tier-1)*stride[i_tier]*stride[i_tier]*temporalStride[i_tier];
end
local nonConvSize           = 16;
if nonConvFlag then
   dictionarySize[tiers]    = dictionarySize[tiers]/nonConvSize;
end
local weightInitRange       = {};
local weightSparsity        = {};
local plasticity            = {};
local learningRate          = {};
weightInitRange[1]          = 1.0;
weightSparsity[1]           = 0.9;
plasticity[1]               = true;
learningRate[1]             = 0.01;
for i_tier = 1, tiers do
   weightInitRange[i_tier]  = weightInitRange[1];
   weightSparsity[i_tier]   = weightSparsity[1];
   plasticity[i_tier]       = plasticity[1];
   learningRate[i_tier]     = learningRate[1];       
end
for i_tier = 1, tiers do
   --learningRate[i_tier]   = learningRate[i_tier]/(stride[i_tier]*stride[i_tier]);
   learningRate[i_tier]     = learningRate[i_tier]/(stride[i_tier]);
   if not plasticity[i_tier] then
      learningRate[i_tier]  = 0;
   end
end

local displayMultiple       = 5;
local displayPeriod         = 100;   --Number of timesteps to find sparse approximation
local numEpochs             = 10;      --Number of times to run through dataset
local numImages             = 20;  --Total number of frames in dataset
local stopTime              = (numImages * displayPeriod * displayMultiple * numEpochs) / skipFrame;
local stopTimeTmp           = "000350000";
local writeStep             = displayPeriod * displayMultiple * 1;
local initialWriteTime      = displayPeriod * displayMultiple * 1;

local runName               = "train";
local runVersion            = 1;
local scratchPath           = "/home/savanna/Projects/AFRL";
local expName               = "starField" .. "_" .. "SPM";
for i_tier = 1, tiers do
   expName                  = expName .. "_" .. math.floor(patchSizeATA[i_tier]) .. "X" .. math.floor(patchSizeATA[i_tier]) .. "X" .. math.floor(dictionarySize[i_tier]);
end
local paramsFilename        = expName .. "_" .. numFrames .. "_" .. displayPeriod*displayMultiple .. "_" .. runName .. runVersion .. ".params";
local imageInputPath        = scratchPath .. "/data/" .. "starField_up10.pvp";
local outputPath            = scratchPath .. "/PVout/" .. expName .. "_" .. numFrames .. "_" .. displayPeriod*displayMultiple .."/" .. runName .. runVersion;
local initPath              = scratchPath .. "/" .. expName .. "_" .. numFrames .. "_" .. displayPeriod*displayMultiple .."/" .. runName .. runVersion-1;
if runVersion == 1 then
   initPath = nil;
end
local initializeFromCheckpointDir = nil;
if initPath then
   initializeFromCheckpointDir = initPath .. "/Checkpoints/Checkpoint" .. stopTimeTmp;
end
local checkpointPeriod = (displayPeriod * displayMultiple * 10);

local momentumTau           = 200;

local VThreshBase           = 0.4; --0.2;
local VThreshScale          = 0.5; --0.75; 0.25; --
local VThresh               = {};
for i_tier = 1, tiers do
   VThresh[i_tier]          = VThreshBase * math.pow(VThreshScale,i_tier-1);
end
local VWidth                = {};
for i_tier = 1, tiers do
   VWidth[i_tier]           = 0;
end
local timeConstantTau       = {};
local baseTau               = 5*math.floor(1000/1); --math.floor(1000/4);
timeConstantTau[1]          = baseTau;
for i_tier = 2, tiers do
   timeConstantTau[i_tier] = baseTau * (1 + 0*(i_tier-1)/(tiers-1)); -- baseTau * (1 + 15*(i_tier-1)/(tiers-1));
end
local AMin                  = 0;
local AMax                  = infinity;

local immediateLayerPublish = true;--false; --
local minDelay              = 0;--1; --
local equalPhaseFlag        = false; --true; --

-- Base table variable to store
local pvParams = {
   column = {
      groupType = "HyPerCol";
      startTime                           = 0;
      dt                                  = 1;
      stopTime                            = stopTime;
      progressInterval                    = 10;
      writeProgressToErr                  = true;
      verifyWrites                        = false;
      outputPath                          = outputPath;
      printParamsFilename                 = paramsFilename;
      randomSeed                          = 1234567890;
      nx                                  = inputWidth;
      ny                                  = inputHeight;
      nbatch                              = nbatch;
      initializeFromCheckpointDir         = nil; --"";
      --defaultInitializeFromCheckpointFlag = false;
      checkpointWrite                     = true;
      checkpointWriteDir                  = outputPath .. "/Checkpoints"; --The checkpoint output directory
      checkpointWriteTriggerMode          = "step";
      checkpointWriteStepInterval         = checkpointPeriod; --How often to checkpoint
      deleteOlderCheckpoints              = true;
      numCheckpointsKept                  = 2;
      suppressNonplasticCheckpoints       = false;
      writeTimescales                     = true;
      errorOnNotANumber                   = false;
   } 
}
if initPath then
   pvParams.column.initializeFromCheckpointDir = initializeFromCheckpointDir;
   --pvParams.column.defaultInitializeFromCheckpointFlag = false; --true;
end

local adaptiveTimeScalesFlag = false;
if adaptiveTimeScales then
   pv.addGroup(pvParams,
	       "AdaptiveTimeScales",
	       {
		  groupType                           = "LogTimeScaleProbe";
		  targetName                          = "EnergyProbe";
		  message                             = NULL;
		  textOutputFlag                      = true;
		  probeOutputFile                     = "AdaptiveTimeScales.txt";
		  triggerLayerName                    = "Frame" .. "_" .. 0;
		  triggerOffset                       = 0;
		  baseMax                             = 0.011;
		  baseMin                             = 0.01;
		  tauFactor                           = 0.025;
		  growthFactor                        = 0.025;
		  logThresh                           = 0.5;
		  logSlope                            = 0.01;
		  writeTimeScales                     = true;
	       }
   )
end -- adaptiveTimeScalesFlag

--Layers----------------------------------------------------
------------------------------------------------------------
for i_frame = 1, numFrames do

   local start_frame_index_array = {}
   local skip_frame_index_array = {}
   for i_batch = 1, nbatch do
      start_frame_index_array[i_batch] = startFrame + i_frame-1 + math.floor((i_batch-1)*numImages/nbatch);
      skip_frame_index_array[i_batch] = skipFrame;
   end
   
   pv.addGroup(pvParams,
	       "Frame" .. "_" .. i_frame-1, 
	       {
		  groupType                           = "PvpLayer";
		  nxScale                             = 1;
		  nyScale                             = 1;
		  nf                                  = 1;
		  phase                               = 0;
		  mirrorBCflag                        = true;
		  writeStep                           = writeStep;
		  initialWriteTime                    = initialWriteTime;
		  sparseLayer                         = false;
		  updateGpu                           = false;
		  dataType                            = nil;
		  inputPath                           = imageInputPath;
		  offsetAnchor                        = "cc";
		  offsetX                             = 0;
		  offsetY                             = 0;
		  writeImages                         = 0;
		  inverseFlag                         = false;
		  normalizeLuminanceFlag              = true;
		  normalizeStdDev                     = true;
		  jitterFlag                          = 0;
		  useInputBCflag                      = false;
		  padValue                            = 0;
		  autoResizeFlag                      = true;
		  aspectRatioAdjustment               = "crop";
		  --interpolationMethod                 = "bicubic";
		  displayPeriod                       = displayPeriod * displayMultiple;
		  batchMethod                         = "bySpecified"; --"byFile";
		  writeFrameToTimestamp               = true;
		  resetToStartOnLoop                  = false;
		  start_frame_index                   = start_frame_index_array;
		  skip_frame_index                    = skip_frame_index_array;
	       }
   )


end -- i_frame


-- pv.addGroup(pvParams,
-- 	    "ClockLayer" .. 1,
-- 	    {
-- 	       groupType                           = "PvpLayer";
-- 	       nxScale                             = 2/inputWidth;
-- 	       nyScale                             = 2/inputHeight;
-- 	       nf                                  = 1;
-- 	       writeStep                           = errorWrite;
-- 	       initialWriteTime                    = errorWrite;
-- 	       inputPath                           = scratchPath .. "/" .. "clockLayer2X2" .. ".pvp";
-- 	       phase                               = 1;
-- 	       mirrorBCflag                        = false;
-- 	       sparseLayer                         = false;
-- 	       updateGpu                           = false;
-- 	       dataType                            = nil;
-- 	       offsetAnchor                        = "cc";
-- 	       offsetX                             = 0;
-- 	       offsetY                             = 0;
-- 	       writeImages                         = 0;
-- 	       inverseFlag                         = false;
-- 	       normalizeLuminanceFlag              = false;
-- 	       normalizeStdDev                     = false;
-- 	       jitterFlag                          = 0;
-- 	       useInputBCflag                      = false;
-- 	       padValue                            = 0;
-- 	       autoResizeFlag                      = false; --true;
-- 	       --aspectRatioAdjustment               = "pad";
-- 	       --interpolationMethod                 = "bicubic";
-- 	       displayPeriod                       = math.ceil(displayPeriod * displayMultiple * temporalStride[1]);
-- 	       batchMethod                         = "byFile";
-- 	       writeFrameToTimestamp               = true;
-- 	       resetToStartOnLoop                  = false;
-- 	       initializeFromCheckpointFlag        = false;
-- 	    }
-- )
-- for i_tier = 2, tiers do
--    pv.addGroup(pvParams,
-- 	       "ClockLayer" .. i_tier,
-- 	       pvParams["ClockLayer" .. 1],
-- 	       {
-- 		  displayPeriod                       = displayPeriod * displayMultiple * temporalStride[i_tier];
-- 	       }
--    )

-- end


--LCA Stack loop--------------------------------------
------------------------------------------------------

--initialize layer names
local inputLayer            = "Frame";
local inputCloneLayer       = "Frame";
local lcaPrefix             = "S";
local lcaIndex              = 1;
local inputLayerFeatures    = inputFeatures;
local inputLayerScale       = 1;
local basePhase             = 1;
local gpuGroupIdx           = -1;
local errorWrite            = -1 -- displayPeriod * displayMultiple;
local lcaLayer              = lcaPrefix .. lcaIndex .. "Muggle";
local probeLayer            = lcaLayer;
local errorLayer            = nil; 
local reconLayer            = nil; 
local inputDCALayerScale    = nil;
local inputDCALayer         = nil
local inputDCALayerFeatures = nil;
local errorDCALayer         = nil;
local reconDCALayer         = nil;
local energyProbeFlag       = true;
local lcaLayerX             = nil;
local inputLayerX           = nil;
local inputDCALayerX        = nil;
local errorLayerX           = nil;
local errorDCALayerX        = nil;
local lcaLayerDiff          = nil;
local reconLayerX           = nil;
local reconDCALayerX        = nil;


for muggleFlag = 0, 1 do
   
   inputLayer               = "Frame";
   inputCloneLayer          = "Frame";
   lcaPrefix                = "S";
   lcaIndex                 = 1;
   inputLayerFeatures       = inputFeatures;
   inputLayerScale          = 1;
   basePhase                = 1;
   gpuGroupIdx              = -1;
   if muggleFlag == 1 then
      lcaLayer              = lcaPrefix .. lcaIndex .. "Muggle";
   else
      lcaLayer              = lcaPrefix .. lcaIndex .. "Oracle";
   end
   probeLayer               = lcaLayer;
   errorLayer               = nil; 
   reconLayer               = nil; 
   inputDCALayerScale       = nil;
   inputDCALayer            = nil
   inputDCALayerFeatures    = nil;
   errorDCALayer            = nil;
   reconDCALayer            = nil;
   lcaLayerX                = lcaPrefix .. lcaIndex .. "Oracle";
   inputLayerX              = "Frame";
   inputDCALayerX           = nil;
   errorLayerX              = nil;
   errorDCALayerX           = nil;
   lcaLayerDiff             = lcaPrefix .. lcaIndex .. "Diff";
   reconLayerX              = nil;
   reconDCALayerX           = nil;
   
   for i_tier = 1, tiers do
      
      --LCA Stack Layers------------------------------------
      ------------------------------------------------------
      
      if i_tier > 1 then
	 basePhase             = basePhase + 3;
	 inputDCALayerScale    = inputLayerScale;
	 inputLayerScale       = 1 / stride[i_tier-1];
	 inputDCALayer         = inputLayer;
	 inputLayer            = lcaLayer;
	 inputCloneLayer       = lcaLayer .. "Clone";
	 inputDCALayerFeatures = inputLayerFeatures
	 inputLayerFeatures    = dictionarySize[i_tier-1];
	 lcaIndex              = i_tier
	 lcaLayerX             = lcaPrefix .. lcaIndex .. "Oracle";
	 inputLayerX            = lcaPrefix .. lcaIndex-1 .. "Oracle";
	 if i_tier > 2 then
	    inputDCALayerX = lcaPrefix .. lcaIndex-2 .. "Oracle";
	 else
	    inputDCALayerX = "Frame";
	 end
	 if muggleFlag == 1 then
	    lcaLayer       = lcaPrefix .. lcaIndex .. "Muggle";
	 else
	    lcaLayer       = lcaPrefix .. lcaIndex .. "Oracle";
	 end
	 probeLayer        = lcaLayer;
	 lcaLayerDiff          = lcaPrefix .. lcaIndex .. "Diff";
      end

      --------------------
      -- LCA Stack Probes
      --------------------
      local frame_offset = 0;
      local frame_stride = 1;
      if i_tier > 1 then
	 frame_offset = temporalSize[i_tier-1]-1;
	 frame_stride = temporalStride[i_tier-1];
      end      
      for i_frame = 1, numFrames - frame_offset, frame_stride do

	 errorLayer        = inputLayer .. "_" .. i_frame-1 .. "Recon" .. "Error";
	 if muggleFlag == 1 then
	    errorLayer     = errorLayer .. "Muggle";
	 else
	    errorLayer     = errorLayer .. "Oracle";
	 end
	 reconLayer        = inputLayer .. "_" .. i_frame-1 .. "Recon" .. lcaLayer;
	 
	 if energyProbeFlag then
	    pv.addGroup(pvParams,
			errorLayer .. "L2Probe",
			{
			   groupType                           = "L2NormProbe";
			   targetLayer                         = errorLayer;
			   message                             = nil;
			   textOutputFlag                      = false;
			   probeOutputFile                     = errorLayer .. "L2Probe.txt";
			   energyProbe                         = "EnergyProbe";
			   coefficient                         = 0.5;
			   maskLayerName                       = nil;
			   exponent                            = 2;
			}
	    )
	 end
	 
	 --Error layer
	 pv.addGroup(pvParams,
		     errorLayer,
		     {
			groupType                           = "HyPerLayer";
			nxScale                             = inputLayerScale;
			nyScale                             = inputLayerScale;
			nf                                  = inputLayerFeatures;
			phase                               = basePhase;
			mirrorBCflag                        = false;
			valueBC                             = 0;
			-- initializeFromCheckpointFlag        = false;
			InitVType                           = "ZeroV";
			triggerLayerName                    = NULL;
			writeStep                           = errorWrite;
			initialWriteTime                    = errorWrite;
			sparseLayer                         = false;
			updateGpu                           = false;
			dataType                            = nil;
		     }
	 )
	 if not immediateLayerPublish and equalPhaseFlag then
	    pvParams[errorLayer].phase                  = 1;
	 end
	 if muggleFlag == 1 then
	    errorLayerX                                  = inputLayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "X";
	    pv.addGroup(pvParams,
			errorLayerX,
			pvParams[errorLayer],
			{
			   phase                               = basePhase + 3;
			}
	    )
	    pvParams[errorLayerX].triggerLayerName                    = "Frame" .. "_" .. 0; --"ClockLayer" .. i_tier;
	    pvParams[errorLayerX].triggerOffset                       = 0;
	    pvParams[errorLayerX].triggerBehavior                     = "updateOnlyOnTrigger";
	 end

	 --Recon layer
	 pv.addGroup(pvParams,
	 	     reconLayer,
	 	     pvParams[errorLayer],
	 	     {
	 		phase                               = basePhase + 2;
	 	     }
	 )
	 if not immediateLayerPublish and equalPhaseFlag then
	    pvParams[reconLayer].phase                  = 1;
	 end
	 if i_tier == 1 then
	    pvParams[reconLayer].writeStep              = writeStep;
	    pvParams[reconLayer].initialWriteTime       = writeStep;
	 end
	 
      end -- i_frame
      
      if i_tier > 1 then	 
	 local frame_offset = 0;
	 local frame_stride = 1;
	 if i_tier > 2 then
	    frame_offset = temporalSize[i_tier-2]-1;
	    frame_stride = temporalStride[i_tier-2];
	 end      
	 for i_frame = 1, numFrames - frame_offset, frame_stride do

	    reconDCALayer     = inputDCALayer .. "_" .. i_frame-1 .. "Recon" .. lcaLayer;
	    pv.addGroup(pvParams,
			reconDCALayer,
			pvParams[reconLayer],
			{
			   nxScale                             = inputDCALayerScale;
			   nyScale                             = inputDCALayerScale;
			   nf                                  = inputDCALayerFeatures;
			}
	    )
	    if not immediateLayerPublish and equalPhaseFlag then
	       pvParams[reconDCALayer].phase                  = 1;
	    end
	    if i_tier == 2 then
	       pvParams[reconDCALayer].writeStep           = writeStep;
	       pvParams[reconDCALayer].initialWriteTime    = writeStep;
	    end

	    if muggleFlag == 1 then
	       errorDCALayerX                                  = inputDCALayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "XX";
	       pv.addGroup(pvParams,
			   errorDCALayerX,
			   pvParams[errorLayer],
			   {
			      nxScale                             = inputDCALayerScale;
			      nyScale                             = inputDCALayerScale;
			      nf                                  = inputDCALayerFeatures;
			      phase                               = basePhase + 3;
			   }
	       )
	       pvParams[errorDCALayerX].triggerLayerName                    = "Frame" .. "_" .. 0; --"ClockLayer" .. i_tier;
	       pvParams[errorDCALayerX].triggerOffset                       = 0;
	       pvParams[errorDCALayerX].triggerBehavior                     = "updateOnlyOnTrigger";
	    end

	 end -- i_frame
      end -- i_tier > 1
      
      --LCA layer
      for i_frame = 1, numFrames - temporalSize[i_tier] + 1, temporalStride[i_tier] do
	 
	 if energyProbeFlag then
	    pv.addGroup(pvParams,
			lcaLayer .. "_" .. i_frame-1 .. "FirmThreshProbe",
			{
			   groupType                           = "FirmThresholdCostFnLCAProbe";
			   targetLayer                         = probeLayer .. "_" .. i_frame-1;
			   message                             = NULL;
			   textOutputFlag                      = false;
			   probeOutputFile                     = probeLayer .. "_" .. i_frame-1 .. "FirmThreshProbe.txt";
			   triggerLayerName                    = NULL;
			   energyProbe                         = "EnergyProbe";
			   maskLayerName                       = NULL;
			}
	    )
	 end
	 
	 pv.addGroup(pvParams,
		     lcaLayer .. "_" .. i_frame-1,
		     {
			groupType                           = "HyPerLCALayer";
			nxScale                             = 1/stride[i_tier];
			nyScale                             = 1/stride[i_tier];
			nf                                  = dictionarySize[i_tier];
			phase                               = basePhase+1;
			mirrorBCflag                        = false;
			valueBC                             = 0;
			InitVType                           = "ConstantV";
			valueV                              = VThresh[i_tier]/2;
			triggerLayerName                    = NULL;
			writeStep                           = displayPeriod * displayMultiple;
			initialWriteTime                    = displayPeriod * displayMultiple;
			sparseLayer                         = true;
			writeSparseValues                   = true;
			updateGpu                           = true;
			dataType                            = nil;
			VThresh                             = VThresh[i_tier];
			AMin                                = AMin;
			AMax                                = AMax;
			AShift                              = 0; --VThresh; --/ i;
			VWidth                              = VWidth[i_tier];
			clearGSynInterval                   = 0;
			timeConstantTau                     = timeConstantTau[i_tier];
			selfInteract                        = true;
			adaptiveTimeScaleProbe              = nil; --"AdaptiveTimeScales";
		     }
	 )
	 if not immediateLayerPublish and equalPhaseFlag then
	    pvParams[lcaLayer .. "_" .. i_frame-1].phase                  = 1;
	 end
	 if initPath then
	    pvParams[lcaLayer .. "_" .. i_frame-1].initializeFromCheckpointFlag        = true;
	 end
	 if i_frame < numFrames - temporalSize[i_tier] + 1 then
	    pvParams[lcaLayer .. "_" .. i_frame-1].triggerLayerName                    = "Frame" .. "_" .. 0; --"ClockLayer" .. i_tier;
	    pvParams[lcaLayer .. "_" .. i_frame-1].triggerOffset                       = 0;
	    pvParams[lcaLayer .. "_" .. i_frame-1].triggerBehavior                     = "resetStateOnTrigger";
	    pvParams[lcaLayer .. "_" .. i_frame-1].triggerResetLayerName               = lcaLayer .. "Clone" .. "_" .. i_frame + temporalStride[i_tier] - 1;
	 end
	 
	 --Error layer
	 pv.addGroup(pvParams,
		     lcaLayer .. "Clone" .. "_" .. i_frame-1,
		     {
			groupType                           = "HyPerLayer";
			nxScale                             = 1/stride[i_tier];
			nyScale                             = 1/stride[i_tier];
			nf                                  = dictionarySize[i_tier];
			phase                               = basePhase+1;
			mirrorBCflag                        = false;
			valueBC                             = 0;
			writeStep                           = errorWrite;
			initialWriteTime                    = errorWrite;
			sparseLayer                         = false;
			updateGpu                           = false;
			dataType                            = nil;
		     }
	 )
	 if not immediateLayerPublish and equalPhaseFlag then
	    pvParams[lcaLayer .. "Clone" .. "_" .. i_frame-1].phase                  = 1;
	 end

	 if muggleFlag == 1 then
	    pv.addGroup(pvParams,
			lcaLayerDiff .. "_" .. i_frame-1,
			pvParams[reconLayer],
			{
			   nxScale                             = 1/stride[i_tier];
			   nyScale                             = 1/stride[i_tier];
			   nf                                  = dictionarySize[i_tier];
			}
	    )
	    pvParams[lcaLayerDiff .. "_" .. i_frame-1].triggerLayerName                    = "Frame" .. "_" .. 0; --"ClockLayer" .. i_tier;
	    pvParams[lcaLayerDiff .. "_" .. i_frame-1].triggerOffset                       = 0;
	    pvParams[lcaLayerDiff .. "_" .. i_frame-1].triggerBehavior                     = "updateOnlyOnTrigger";

	    pv.addGroup(pvParams,
			lcaLayerX .. "_" .. i_frame-1 .. "To" .. lcaLayerDiff .. "_" .. i_frame-1,
			{
			   groupType                           = "IdentConn";
			   preLayerName                        = lcaLayerX .. "_" .. i_frame-1;
			   postLayerName                       = lcaLayerDiff .. "_" .. i_frame-1;
			   channelCode                         = 0;
			   delay                               = {0.000000};
			}
	    )
	    if not immediateLayerPublish then
	       pvParams[lcaLayerX .. "_" .. i_frame-1 .. "To" .. lcaLayerDiff .. "_" .. i_frame-1].delay = {minDelay};
	    end
	    pv.addGroup(pvParams,
			lcaLayer .. "_" .. i_frame-1 .. "To" .. lcaLayerDiff .. "_" .. i_frame-1,
			pvParams[lcaLayerX .. "_" .. i_frame-1 .. "To" .. lcaLayerDiff .. "_" .. i_frame-1],
			{
			   preLayerName                        = lcaLayer .. "_" .. i_frame-1;
			   postLayerName                       = lcaLayerDiff .. "_" .. i_frame-1;
			   channelCode                         = 1;
			}
	    )
	 end -- muggleFlag == 1
	       
      end -- i_frame
      
      
      --LCA Stack Connections---------------------------------------------
      --------------------------------------------------------------------
      
      local frame_offset = 0;
      local frame_stride = 1;
      if i_tier > 1 then
	 frame_offset = temporalSize[i_tier-1]-1;
	 frame_stride = temporalStride[i_tier-1];
      end      
      for i_frame = 1, numFrames - frame_offset, frame_stride do

	 errorLayer        = inputLayer .. "_"  .. i_frame-1 .. "Recon" .. "Error";
	 if muggleFlag == 1 then
	    errorLayer     = errorLayer .. "Muggle";
	 else
	    errorLayer     = errorLayer .. "Oracle";
	 end
	 reconLayer        = inputLayer .. "_"  .. i_frame-1 .. "Recon" .. lcaLayer;
	 
	 pv.addGroup(pvParams,
		     inputCloneLayer .. "_" .. i_frame-1 .. "To" .. errorLayer,
		     {
			groupType                           = "IdentConn";
			preLayerName                        = inputLayer .. "_" .. i_frame-1;
			postLayerName                       = errorLayer;
			channelCode                         = 0;
			delay                               = {0.000000};
		     }
	 )
	 if not immediateLayerPublish then
	    pvParams[inputLayer .. "_" .. i_frame-1 .. "To" .. errorLayer].delay = {minDelay};
	 end

	 -- cross-error combines Muggle's Recon, Oracle's Target
	 if muggleFlag == 1 then
	    errorLayerX                                  = inputLayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "X";
	    reconLayerX                                  = inputLayerX .. "_"  .. i_frame-1 .. "Recon" .. lcaLayerX;
	    pv.addGroup(pvParams,
			reconLayerX .. "To" .. errorLayerX,
			{
			   groupType                           = "IdentConn";
			   preLayerName                        = reconLayerX;
			   postLayerName                       = errorLayerX;
			   channelCode                         = 0;
			   delay                               = {0.000000};
			}
	    )
	    if not immediateLayerPublish then
	       pvParams[reconLayerX .. "To" .. errorLayerX].delay = {minDelay};
	    end
	    pv.addGroup(pvParams,
			reconLayer .. "To" .. errorLayerX,
			{
			   groupType                           = "IdentConn";
			   preLayerName                        = reconLayer;
			   postLayerName                       = errorLayerX;
			   channelCode                         = 1;
			   delay                               = {0.000000};
			}
	    )
	    if not immediateLayerPublish then
	       pvParams[reconLayer .. "To" .. errorLayerX].delay = {minDelay};
	    end
	 end -- if muggleFlag == 1
	 
	 pv.addGroup(pvParams,
		     reconLayer .. "To" .. errorLayer,
		     {
			groupType                           = "IdentConn";
			preLayerName                        = reconLayer;
			postLayerName                       = errorLayer;
			channelCode                         = 1;
			delay                               = {0.000000};
		     }
	 )
	 if not immediateLayerPublish then
	    pvParams[reconLayer .. "To" .. errorLayer].delay = {minDelay};
	 end
	 
	 
      end -- i_frame
      
      if i_tier > 1 then
	 local frame_offset = 0;
	 local frame_stride = 1;
	 if i_tier > 2 then
	    frame_offset = temporalSize[i_tier-2]-1;
	    frame_stride = temporalStride[i_tier-2];
	 end      
	 for i_frame = 1, numFrames - frame_offset, frame_stride do
	    
	    reconDCALayer     = inputDCALayer .. "_" .. i_frame-1 .. "Recon" .. lcaLayer;
	    errorDCALayer     = inputDCALayer .. "_" .. i_frame-1 .. "Recon" .. "Error";
	    if muggleFlag == 1 then
	       errorDCALayer     = errorDCALayer .. "Muggle";
	    else
	       errorDCALayer     = errorDCALayer .. "Oracle";
	    end
	    pv.addGroup(pvParams,
			reconDCALayer .. "To" .. errorDCALayer,
			{
			   groupType                           = "IdentConn";
			   preLayerName                        = reconDCALayer;
			   postLayerName                       = errorDCALayer;
			   channelCode                         = 1;
			   delay                               = {0.000000};
			}
	    )
	    if not immediateLayerPublish then
	       pvParams[reconDCALayer .. "To" .. errorDCALayer].delay = {minDelay};
	    end


	    if muggleFlag == 1 then
	       errorDCALayerX                                  = inputDCALayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "XX";
	       reconDCALayerX                                  = inputDCALayerX .. "_" .. i_frame-1 .. "Recon" .. lcaLayerX;
	       pv.addGroup(pvParams,
			   reconDCALayer .. "To" .. errorDCALayerX,
			   {
			      groupType                           = "IdentConn";
			      preLayerName                        = reconDCALayer;
			      postLayerName                       = errorDCALayerX;
			      channelCode                         = 1;
			      delay                               = {0.000000};
			   }
	       )
	       if not immediateLayerPublish then
		  pvParams[reconDCALayer .. "To" .. errorDCALayerX].delay = {minDelay};
	       end
	       pv.addGroup(pvParams,
			   reconDCALayerX .. "To" .. errorDCALayerX,
			   pvParams[reconDCALayer .. "To" .. errorDCALayerX],
			   {
			      preLayerName                        = reconDCALayerX;
			      postLayerName                       = errorDCALayerX;
			      channelCode                         = 0;
			   }
	       )
	    end -- if MuggleFlag == 1

	 end -- i_frame
	 
      end -- i_tier > 1
      
      
      local frame_offset = 0;
      local frame_stride = 1;
      if i_tier > 1 then
	 frame_offset = temporalSize[i_tier-1]-1;
	 frame_stride = temporalStride[i_tier-1];
      end      
      for i_frame = 1, numFrames - frame_offset, frame_stride do
	 
	 errorLayer        = inputLayer .. "_"   .. i_frame-1 .. "Recon" .. "Error";
	 if muggleFlag == 1 then
	    errorLayer    = errorLayer .. "Muggle";
	 else
	    errorLayer    = errorLayer .. "Oracle";
	 end
	 reconLayer        = inputLayer .. "_"   .. i_frame-1 .. "Recon" .. lcaLayer;
	 
	 for i_delay = 1, numFrames - temporalSize[i_tier] + 1, temporalStride[i_tier] do
	    
	    local delta_frame = i_frame - i_delay
	    local temporalSizeLCA = 1;
	    if i_tier > 1 then
	       temporalSizeLCA = temporalSize[i_tier-1];
	    end
	    if (delta_frame >= 0 and (delta_frame + temporalSizeLCA) <= temporalSize[i_tier]) then
	       
	       if i_delay == 1 then

		  if muggleFlag == 0 then
		     
		     pv.addGroup(pvParams,
				 lcaLayer .. "_" .. 0 .. "To" .. errorLayer,
				 {
				    groupType                           = "MomentumConn";
				    preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				    postLayerName                       = errorLayer;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    numAxonalArbors                     = 1;
				    convertRateToSpikeCount             = false;
				    receiveGpu                          = false; -- non-sparse -> non-sparse
				    sharedWeights                       = true;
				    useListOfArborFiles                 = false;
				    combineWeightFiles                  = false;
				    -- triggerLayer                    = "Frame" .. "_" .. i_frame-1;
				    -- triggerOffset                       = 0;
				    initialWeightUpdateTime             = displayPeriod * displayMultiple;
				    weightUpdatePeriod                  = displayPeriod * displayMultiple;
				    updateGSynFromPostPerspective       = false; -- Should be false from S1 (sparse layer) to Error (not sparse). Otherwise every input from pre will be calculated (Instead of only active ones)
				    pvpatchAccumulateType               = "convolve";
				    writeStep                           = -1;
				    initialWriteTime                    = -1;
				    writeCompressedCheckpoints          = false;
				    selfFlag                            = false;
				    shrinkPatches                       = false;
				    normalizeMethod                     = "normalizeL2";
				    strength                            = 1;
				    normalizeArborsIndividually         = false;
				    normalizeOnInitialize               = true;
				    normalizeOnWeightUpdate             = true;
				    rMinX                               = 0;
				    rMinY                               = 0;
				    nonnegativeConstraintFlag           = false;
				    normalize_cutoff                    = 0;
				    normalizeFromPostPerspective        = false;
				    minL2NormTolerated                  = 0;
				    keepKernelsSynchronized             = true; -- Possibly irrelevant
				    useMask                             = false;
				    momentumTau                         = momentumTau;   --The momentum parameter. A single weight update will last for momentumTau timesteps.
				    momentumMethod                      = "viscosity";
				    momentumDecay                       = 0;
				    nxp                                 = patchSize[i_tier];
				    nyp                                 = patchSize[i_tier];
				    plasticityFlag                      = plasticity[i_tier];
				    dWMax                               = learningRate[i_tier]; 
				    weightInitType                      = "UniformRandomWeight";
				    wMinInit                            = -weightInitRange[i_tier];
				    wMaxInit                            = weightInitRange[i_tier];
				    sparseFraction                      = weightSparsity[i_tier];
				    immediateWeightUpdate               = true; --false;
				 }
		     )
		     if not immediateLayerPublish then
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].delay = {minDelay};
		     end
		     
		     if initPath then
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].initializeFromCheckpointFlag = true;
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].weightInitType               = "FileWeight";
			-- if batchwidth > 1 then
			-- 	pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].initWeightsFile           = initializeFromCheckpointDir .. "/" .. "batchsweep_0" .. "/" ..  lcaLayer .. "_" .. 0 .. "To" .. errorLayer .. "_W.pvp";
			-- else
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].initWeightsFile           = initializeFromCheckpointDir .. "/" ..                           lcaLayer .. "_" .. 0 .. "To" .. errorLayer .. "_W.pvp";
			-- end
		     end
		     
		     if delta_frame > 0 then
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].normalizeMethod      = "normalizeGroup";
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer].normalizeGroupName   = lcaLayer .. "_" .. 0 .. "To" .. inputLayer .. "_" .. 0 .. "Recon" .. "Error" .. "Oracle";
		     end
		     if not immediateLayerPublish then
			pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorLayer].delay = {minDelay};
		     end

		  else -- if muggleFlag == 1

		     errorLayerX                                  = inputLayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "X";
		     pv.addGroup(pvParams,
				 lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorLayerX,
				 {
				    groupType                           = "PlasticCloneConn";
				    preLayerName                        = lcaLayerDiff .. "_" .. i_delay-1;
				    postLayerName                       = errorLayerX;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    selfFlag                            = false;
				    preActivityIsNotRate                = false;
				    updateGSynFromPostPerspective       = false;
				    pvpatchAccumulateType               = "convolve";
				    originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputLayerX .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				 }
		     )
		     if not immediateLayerPublish then
			pvParams[lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorLayerX].delay = {minDelay};
		     end

		  end -- muggleFlag == 0
		  
	       else -- i_delay > 1

		  if muggleFlag == 0 then

		     pv.addGroup(pvParams,
				 lcaLayer .. "_" .. i_delay-1 .. "To" .. errorLayer,
				 {
				    groupType                           = "PlasticCloneConn";
				    preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				    postLayerName                       = errorLayer;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    selfFlag                            = false;
				    preActivityIsNotRate                = false;
				    updateGSynFromPostPerspective       = false;
				    pvpatchAccumulateType               = "convolve";
				    originalConnName                    = lcaLayer .. "_" .. 0 .. "To" .. inputLayer .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				 }
		     )
		     if not immediateLayerPublish then
			pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorLayer].delay = {minDelay};
		     end
		     
		  else  -- if muggleFlag == 1

		     errorLayerX                                  = inputLayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "X";
		     pv.addGroup(pvParams,
				 lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorLayerX,
				 {
				    groupType                           = "PlasticCloneConn";
				    preLayerName                        = lcaLayerDiff .. "_" .. i_delay-1;
				    postLayerName                       = errorLayerX;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    selfFlag                            = false;
				    preActivityIsNotRate                = false;
				    updateGSynFromPostPerspective       = false;
				    pvpatchAccumulateType               = "convolve";
				    originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputLayerX .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				 }
		     )
		     if not immediateLayerPublish then
			pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorLayerX .. "Oracle"].delay = {minDelay};
		     end

		  end -- if muggleFlag == 0
		  
	       end -- i_delay > 1

	       -- assume last frame is actually in the future.
	       if i_tier > muggleFlag or i_frame < numFrames then
		  --gpuGroupIdx = (i_tier-1) * temporalSize[tiers] * 2  + delta_frame;

		  pv.addGroup(pvParams,
			      errorLayer .. "To" .. lcaLayer .. "_" .. i_delay-1,
			      {
				 groupType                           = "TransposeConn";
				 preLayerName                        = errorLayer;
				 postLayerName                       = lcaLayer .. "_" .. i_delay-1;
				 channelCode                         = 0;
				 delay                               = {0.000000};
				 convertRateToSpikeCount             = false;
				 receiveGpu                          = true;
				 updateGSynFromPostPerspective       = true;
				 pvpatchAccumulateType               = "convolve";
				 writeStep                           = -1;
				 writeCompressedCheckpoints          = false;
				 selfFlag                            = false;
				 gpuGroupIdx                         = gpuGroupIdx;
				 originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputLayerX .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
			      }
		  )
		  if not immediateLayerPublish then
		     pvParams[errorLayer .. "To" .. lcaLayer .. "_" .. i_delay-1].delay = {minDelay};
		  end
		  
	       end -- frame not in future if-then block
	       
	       pv.addGroup(pvParams,
			   lcaLayer .. "_" .. i_delay-1 .. "To" .. reconLayer,
			   {
			      groupType                           = "CloneConn";
			      preLayerName                        = lcaLayer .. "_" .. i_delay-1;
			      postLayerName                       = reconLayer;
			      channelCode                         = 0;
			      writeStep                           = -1;
			      delay                               = {0.000000};
			      convertRateToSpikeCount             = false;
			      receiveGpu                          = false;
			      updateGSynFromPostPerspective       = false;
			      pvpatchAccumulateType               = "convolve";
			      writeCompressedCheckpoints          = false;
			      selfFlag                            = false;
			      originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputLayerX .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
			   }
	       )
	       if not immediateLayerPublish then
		  pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. reconLayer].delay = {minDelay};
	       end

	    end -- delta_frame > 0
	 end --i_delay
      end -- i_frame

      if i_tier > 1 then
	 local frame_offset = 0;
	 local frame_stride = 1;
	 if i_tier > 2 then
	    frame_offset = temporalSize[i_tier-2]-1;
	    frame_stride = temporalStride[i_tier-2];
	 end      
	 for i_frame = 1, numFrames - frame_offset, frame_stride do
	    
	    errorLayer        = inputLayer .. "_"   .. 0 .. "Recon" .. "Error";
	    if muggleFlag == 1 then
	       errorLayer    = errorLayer .. "Muggle";
	    else
	       errorLayer    = errorLayer .. "Oracle";
	    end
	    reconLayer        = inputLayer .. "_"   .. 0 .. "Recon" .. lcaLayer;
	    if i_tier > 1 then
	       reconDCALayer     = inputDCALayer .. "_" .. i_frame-1 .. "Recon" .. lcaLayer;
	       errorDCALayer     = inputDCALayer .. "_" .. i_frame-1 .. "Recon" .. "Error";
	       if muggleFlag == 1 then
		  errorDCALayer    = errorDCALayer .. "Muggle";
	       else
		  errorDCALayer    = errorDCALayer .. "Oracle";
	       end
	    end
	    
	    for i_delay = 1, numFrames - temporalSize[i_tier] + 1, temporalStride[i_tier] do
	       
	       local delta_frame = i_frame - i_delay
	       local temporalSizeDCA = 1;
	       if i_tier > 2 then
		  temporalSizeDCA = temporalSize[i_tier-2];
	       end
	       if (delta_frame >= 0 and (delta_frame + temporalSizeDCA) <= temporalSize[i_tier]) then

		  if i_delay == 1 then

		     if muggleFlag == 0 then
			
			pv.addGroup(pvParams,
				    lcaLayer .. "_" .. 0 .. "To" .. errorDCALayer,
				    pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorLayer],
				    {
				       preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				       postLayerName                       = errorDCALayer;
				    }
			)
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorDCALayer].normalizeMethod	        = "normalizeGroup";
			pvParams[lcaLayer .. "_" .. 0 .. "To" .. errorDCALayer].normalizeGroupName 	= lcaLayer .. "_" .. 0 .. "To" .. errorLayer;
			
			if (i_tier > 2) and (stride[i_tier] < inputWidth*nonConvHeight) and (stride[i_tier] < inputHeight*nonConvHeight) then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nxp   = patchSize[i_tier-1] + (patchSize[i_tier]-1)*(stride[i_tier-1]/stride[i_tier-2]);
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nyp   = patchSize[i_tier-1] + (patchSize[i_tier]-1)*(stride[i_tier-1]/stride[i_tier-2]);
			elseif i_tier == 2 then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nxp   = patchSize[i_tier-1] + (patchSize[i_tier]-1)*(stride[i_tier-1]);
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nyp   = patchSize[i_tier-1] + (patchSize[i_tier]-1)*(stride[i_tier-1]);
			elseif i_tier == tiers and stride[i_tier] == inputWidth*nonConvHeight then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nxp   = stride[tiers]/(stride[i_tier-2]);
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nyp   = stride[tiers]/(stride[i_tier-2]);
			elseif i_tier == tiers and stride[i_tier] == inputHeight*nonConvHeight then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nxp   = stride[tiers]/(stride[i_tier-2]);
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].nyp   = stride[tiers]/(stride[i_tier-2]);
			end   
			
			if initPath then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].initializeFromCheckpointFlag = true;
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].weightInitType               = "FileWeight";
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].initWeightsFile           = initializeFromCheckpointDir .. "/" ..                           lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer .. "_W.pvp";
			end

			if not immediateLayerPublish then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].delay = {minDelay};
			end

		     else -- if muggleFlag == 1

			errorDCALayerX                                 = inputDCALayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "XX";
			pv.addGroup(pvParams,
				    lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorDCALayerX,
				    {
				       groupType                           = "PlasticCloneConn";
				       preLayerName                        = lcaLayerDiff .. "_" .. i_delay-1;
				       postLayerName                       = errorDCALayerX;
				       channelCode                         = -1;
				       delay                               = {0.000000};
				       selfFlag                            = false;
				       preActivityIsNotRate                = false;
				       updateGSynFromPostPerspective       = false;
				       pvpatchAccumulateType               = "convolve";
				       originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputDCALayerX  .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				    }
			)
			if not immediateLayerPublish then
			   pvParams[lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorDCALayerX].delay = {minDelay};
			end

		     end -- if muggleFlag == 0
		     
		  else -- i_delay > 1
		     
		     if muggleFlag == 0 then
			
			pv.addGroup(pvParams,
				    lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer,
				    {
				       groupType                           = "PlasticCloneConn";
				       preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				       postLayerName                       = errorDCALayer;
				       channelCode                         = -1;
				       delay                               = {0.000000};
				       selfFlag                            = false;
				       preActivityIsNotRate                = false;
				       updateGSynFromPostPerspective       = false;
				       pvpatchAccumulateType               = "convolve";
				       originalConnName                    = lcaLayer .. "_" .. 0 .. "To" .. inputDCALayer  .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				    }
			)
			if not immediateLayerPublish then
			   pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. errorDCALayer].delay = {minDelay};
			end

		     else -- if muggleFlag == 1

			errorDCALayerX                                 = inputDCALayerX .. "_" .. i_frame-1 .. "Recon" .. "Error" .. "XX";
			pv.addGroup(pvParams,
				    lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorDCALayerX,
				    {
				       groupType                           = "PlasticCloneConn";
				       preLayerName                        = lcaLayerDiff .. "_" .. i_delay-1;
				       postLayerName                       = errorDCALayerX;
				       channelCode                         = -1;
				       delay                               = {0.000000};
				       selfFlag                            = false;
				       preActivityIsNotRate                = false;
				       updateGSynFromPostPerspective       = false;
				       pvpatchAccumulateType               = "convolve";
				       originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputDCALayerX  .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				    }
			)
			if not immediateLayerPublish then
			   pvParams[lcaLayerDiff .. "_" .. i_delay-1 .. "To" .. errorDCALayerX].delay = {minDelay};
			end

		     end -- if muggleFlag == 0
		     
		  end -- i_delay == 1
		  
		  if i_tier > muggleFlag+1 or i_frame < numFrames then
		     --gpuGroupIdx = (i_tier-1) * temporalSize[tiers] * 2  + temporalSize[tiers] + delta_frame;
		     pv.addGroup(pvParams,
				 errorDCALayer .. "To" .. lcaLayer .. "_" .. i_delay-1,
				 pvParams[errorLayer .. "To" .. lcaLayer .. "_" .. 0],
				 {
				    preLayerName                        = errorDCALayer;
				    postLayerName                       = lcaLayer .. "_" .. i_delay-1;
				    originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputDCALayerX  .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
				    gpuGroupIdx                         = gpuGroupIdx;
				 }
		     )
		  end -- frame is not in future if-then block
		  pv.addGroup(pvParams,
			      lcaLayer .. "_" .. i_delay-1 .. "To" .. reconDCALayer,
			      pvParams[lcaLayer .. "_" .. 0 .. "To" .. reconLayer],
			      {
				 preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				 postLayerName                       = reconDCALayer;
				 originalConnName                    = lcaLayerX .. "_" .. 0 .. "To" .. inputDCALayerX  .. "_" .. delta_frame .. "Recon" .. "Error" .. "Oracle";
			      }
		  )	    
		  
	       end -- if i_delay > 0
	    end -- for i_delay
	 end -- for i_frame
      end -- i_tier > 1

      -- top-down
      if i_tier > 1 then
	 local frame_offset = 0;
	 local frame_stride = 1;
	 if i_tier > 1 then
	    frame_offset = temporalSize[i_tier-1]-1;
	    frame_stride = temporalStride[i_tier];
	 end      
	 for i_frame = 1, numFrames - frame_offset, frame_stride do
	    
	    errorLayer        = inputLayer .. "_" .. i_frame-1 .. "Recon" .. "Error";
	    if muggleFlag == 1 then
	       errorLayer    = errorLayer .. "Muggle";
	    else
	       errorLayer    = errorLayer .. "Oracle";
	    end
	    
	    pv.addGroup(pvParams,
			errorLayer .. "To" .. inputLayer .. "_" .. i_frame-1,
			{
			   groupType                           = "IdentConn";
			   preLayerName                        = errorLayer;
			   postLayerName                       = inputLayer .. "_" .. i_frame-1;
			   channelCode                         = 1;
			   delay                               = {0.000000};
			}
	    )
	    if not immediateLayerPublish then
	       pvParams[errorLayer .. "To" .. inputLayer .. "_" .. i_frame-1].delay = {minDelay};
	    end
	    
	 end -- i_frame
      end -- i_tier > 1


      local frame_offset = 0;
      local frame_stride = 1;
      if muggleFlag == 0 then
	 for i_frame = 1, numFrames - frame_offset, frame_stride do
	    
	    for i_delay = 1, numFrames - temporalSize[i_tier] + 1, temporalStride[i_tier] do
	       
	       local delta_frame = i_frame - i_delay
	       if (delta_frame >= 0 and delta_frame < temporalSizeATA[i_tier]) then
		  
		  if i_delay == 1 then
		     
		     pv.addGroup(pvParams,
				 lcaLayer .. "_" .. i_delay-1 .. "To" .. "Frame" .. "_" .. i_frame-1 .. "_ATA",
				 {
				    groupType                           = "HyPerConn";
				    preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				    postLayerName                       = "Frame" .. "_" .. i_frame-1;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    numAxonalArbors                     = 1;
				    plasticityFlag                      = true;
				    convertRateToSpikeCount             = false;
				    receiveGpu                          = false; -- non-sparse -> non-sparse
				    sharedWeights                       = true;
				    weightInitType                      = "UniformRandomWeight";
				    wMinInit                            = 0;
				    wMaxInit                            = 0;
				    sparseFraction                      = 0;
				    useListOfArborFiles                 = false;
				    combineWeightFiles                  = false;
				    initializeFromCheckpointFlag        = false;
				    triggerLayerName                    = "Frame" .. "_" .. 0;
				    triggerOffset                       = 0;
				    updateGSynFromPostPerspective       = false; -- Should be false from S1 (sparse layer) to Error (not sparse). Otherwise every input from pre will be calculated (Instead of only active ones)
				    pvpatchAccumulateType               = "convolve";
				    writeStep                           = -1;
				    initialWriteTime                    = -1;
				    writeCompressedCheckpoints          = false;
				    selfFlag                            = false;
				    nxp                                 = patchSizeATA[i_tier];
				    nyp                                 = patchSizeATA[i_tier];
				    shrinkPatches                       = false;
				    normalizeMethod                     = "none";
				    dWMax                               = 1;
				    keepKernelsSynchronized             = true; -- Possibly irrelevant
				    useMask                             = false;
				    immediateWeightUpdate               = true; --false;
				 }
		     )
		     if not immediateLayerPublish then
			pvParams[lcaLayer .. "_" .. i_delay-1 .. "To" .. "Frame" .. "_" .. i_frame-1 .. "_ATA"].delay = {minDelay};
		     end
		     
		  else
		     
		     pv.addGroup(pvParams,
				 lcaLayer .. "_" .. i_delay-1 .. "To" .. "Frame" .. "_" .. i_frame-1 .. "_ATA",
				 {
				    groupType                           = "PlasticCloneConn";
				    preLayerName                        = lcaLayer .. "_" .. i_delay-1;
				    postLayerName                       = "Frame" .. "_" .. i_frame-1;
				    channelCode                         = -1;
				    delay                               = {0.000000};
				    selfFlag                            = false;
				    preActivityIsNotRate                = false;
				    updateGSynFromPostPerspective       = false;
				    pvpatchAccumulateType               = "convolve";
				    originalConnName                    = lcaLayer .. "_" .. 0 .. "To" .. "Frame" .. "_" .. delta_frame .. "_ATA";
				 }
		     )
		     
		  end -- i_delay == 1
		  
	       end -- i_frame < temporaleSizeATA
	       
	    end -- i_delay
	    
	 end -- i_frame
	 
      end -- muggleFlag
      
   end  -- i_tier
   
end -- muggleFlag

--Probes------------------------------------------------------------
--------------------------------------------------------------------

pv.addGroup(pvParams,
	    "EnergyProbe",
	    {
	       groupType                           = "ColumnEnergyProbe";
	       message                             = nil;
	       textOutputFlag                      = true;
	       probeOutputFile                     = "EnergyProbe.txt";
	       triggerLayerName                    = nil;
	       energyProbe                         = nil;
	    }
)

-- Print out PetaVision approved parameter file to the console
pv.printConsole(pvParams)
