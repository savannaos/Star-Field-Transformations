-- PetaVision, git repository version cf0c749f43aae4b571930e4f03d322a18702ec13 (Tue Jun 6 16:45:54 2017 -0600)
-- Run time Tue Jun 20 10:06:36 2017
-- Compiled with MPI and run using 2 rows, 2 columns, and MPI batch dimension 2.
-- Compiled with CUDA.
-- Compiled with OpenMP parallel code and run using 8 threads.
package.path = package.path .. ";" .. "/home/ssmith/OpenPV/src/../parameterWrapper/?.lua"
local pv = require "PVModule"

-- Base table variable to store
local pvParameters = {
column = {
groupType = "HyPerCol";
    startTime                           = 0;
    dt                                  = 1;
    stopTime                            = 10000;
    progressInterval                    = 10;
    writeProgressToErr                  = true;
    outputPath                          = "/nh/compneuro/scratch/starOutstarField_SPM_9X9X4_18X18X8_6_500/train1";
    verifyWrites                        = false;
    checkpointWrite                     = true;
    checkpointWriteDir                  = "/nh/compneuro/scratch/starOutstarField_SPM_9X9X4_18X18X8_6_500/train1/Checkpoints";
    checkpointWriteTriggerMode          = "step";
    checkpointWriteStepInterval         = 5000;
    checkpointIndexWidth                = -1;
    suppressNonplasticCheckpoints       = false;
    deleteOlderCheckpoints              = true;
    numCheckpointsKept                  = 2;
    initializeFromCheckpointDir         = "";
    printParamsFilename                 = "starField_SPM_9X9X4_18X18X8_6_500_train1.params";
    randomSeed                          = 1234567890;
    nx                                  = 256;
    ny                                  = 256;
    nbatch                              = 10;
    errorOnNotANumber                   = false;
};

S2OracleClone_2 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Diff_2 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_2ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Diff_0 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1OracleClone_2 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_1ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1OracleClone_0 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1MuggleClone_3 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_1ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_3ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_0ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_1ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {2.000000,4.000000,6.000000,8.000000,10.000000,12.000000,14.000000,16.000000,18.000000,20.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

S1Oracle_0ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_3ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {1.000000,3.000000,5.000000,7.000000,9.000000,11.000000,13.000000,15.000000,17.000000,19.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

S1Muggle_2 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1MuggleClone_3";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_5ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Diff_1 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_0ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_3ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2MuggleClone_2 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Muggle_2 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

S1MuggleClone_2 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2MuggleClone_0 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2MuggleClone_1 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2OracleClone_0 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_3ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_2ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {4.000000,6.000000,8.000000,10.000000,12.000000,14.000000,16.000000,18.000000,20.000000,22.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

S1Muggle_0ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_1ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_3 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

S2Oracle_1 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S2OracleClone_2";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_2ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1OracleClone_3 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_1 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1OracleClone_2";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_4ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_5ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_2ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_1ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconS2Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Diff_3 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_0ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Diff_2 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_0ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {3.000000,5.000000,7.000000,9.000000,11.000000,13.000000,15.000000,17.000000,19.000000,21.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

Frame_5ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Diff_1 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1MuggleClone_1 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_1 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1MuggleClone_2";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_0ReconS1Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Diff_0 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_4 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {5.000000,7.000000,9.000000,11.000000,13.000000,15.000000,17.000000,19.000000,21.000000,23.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

Frame_4ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_3ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_0 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1MuggleClone_1";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_3ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_2ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_0 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1OracleClone_1";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_1ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1OracleClone_1 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Muggle_1 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S2MuggleClone_2";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

S1Oracle_2 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S1OracleClone_3";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_4ReconErrorOracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 1;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Muggle_2ReconErrorMuggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 4;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Muggle_0 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S2MuggleClone_1";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_5 = {
groupType = "PvpLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 0;
    mirrorBCflag                        = true;
    initializeFromCheckpointFlag        = false;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
    displayPeriod                       = 500;
    inputPath                           = "/home/ssmith/Star-Field-Transformations/data/starFieldpvp/up256.pvp";
    offsetAnchor                        = "cc";
    offsetX                             = 0;
    offsetY                             = 0;
    autoResizeFlag                      = true;
    aspectRatioAdjustment               = "crop";
    interpolationMethod                 = "bicubic";
    inverseFlag                         = false;
    normalizeLuminanceFlag              = true;
    normalizeStdDev                     = true;
    useInputBCflag                      = false;
    padValue                            = 0;
    batchMethod                         = "bySpecified";
    start_frame_index                   = {6.000000,8.000000,10.000000,12.000000,14.000000,16.000000,18.000000,20.000000,22.000000,24.000000};
    skip_frame_index                    = {1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000,1.000000};
    resetToStartOnLoop                  = false;
    writeFrameToTimestamp               = true;
};

Frame_2ReconS2Oracle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 6;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

Frame_1ReconS1Muggle = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 3;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_3ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2OracleClone_1 = {
groupType = "HyPerLayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Oracle_0 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "resetStateOnTrigger";
    triggerResetLayerName               = "S2OracleClone_1";
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_0ReconErrorXX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 1;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S2Oracle_2 = {
groupType = "HyPerLCALayer";
    nxScale                             = 0.5;
    nyScale                             = 0.5;
    nf                                  = 8;
    phase                               = 5;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.1;
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.2;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

S1MuggleClone_0 = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = -70;
    triggerLayerName                    = nil;
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_2ReconErrorX = {
groupType = "HyPerLayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 7;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ZeroV";
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    triggerBehavior                     = "updateOnlyOnTrigger";
    writeStep                           = -1;
    sparseLayer                         = false;
    updateGpu                           = false;
    dataType                            = nil;
};

S1Oracle_3 = {
groupType = "HyPerLCALayer";
    nxScale                             = 1;
    nyScale                             = 1;
    nf                                  = 4;
    phase                               = 2;
    mirrorBCflag                        = false;
    valueBC                             = 0;
    initializeFromCheckpointFlag        = false;
    InitVType                           = "ConstantV";
    valueV                              = 0.2;
    triggerLayerName                    = nil;
    writeStep                           = 500;
    initialWriteTime                    = 500;
    sparseLayer                         = true;
    updateGpu                           = true;
    dataType                            = nil;
    VThresh                             = 0.4;
    AMin                                = 0;
    AMax                                = infinity;
    AShift                              = 0;
    VWidth                              = 0;
    timeConstantTau                     = 5000;
    selfInteract                        = true;
    adaptiveTimeScaleProbe              = nil;
};

Frame_3ToFrame_3ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorMuggleToS1Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S1Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Diff_3ToFrame_4ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_3";
    postLayerName                       = "Frame_4ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_0ToFrame_0ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0";
    postLayerName                       = "Frame_0ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconS1OracleToFrame_0ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS1Oracle";
    postLayerName                       = "Frame_0ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_3ReconS2MuggleToS1Oracle_3ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_3ReconS2Muggle";
    postLayerName                       = "S1Oracle_3ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_5ReconS2OracleToFrame_5ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS2Oracle";
    postLayerName                       = "Frame_5ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToFrame_2ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_2ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_1ToS2Diff_1 = {
groupType = "IdentConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "S2Diff_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_0ToS1Diff_0 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "S1Diff_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Diff_1ToFrame_3ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "Frame_3ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Diff_0ToFrame_2ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "Frame_2ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_2ToFrame_5ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_5ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

Frame_2ReconErrorOracleToS1Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S1Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_5ReconErrorOracleToS1Oracle_3 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_5ReconErrorOracle";
    postLayerName                       = "S1Oracle_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_3ReconS2OracleToFrame_3ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS2Oracle";
    postLayerName                       = "Frame_3ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS2OracleToFrame_4ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS2Oracle";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconErrorOracleToS1Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorOracle";
    postLayerName                       = "S1Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Oracle_3ToFrame_4ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_4ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Diff_2ToFrame_4ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "Frame_4ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S1Muggle_1ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_1ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

Frame_3ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S1Diff_1ToFrame_3ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_1";
    postLayerName                       = "Frame_3ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_2ReconS1MuggleToFrame_2ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS1Muggle";
    postLayerName                       = "Frame_2ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_0ToFrame_1ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S1Oracle_0ToFrame_0ReconErrorOracle";
    dWMax                               = 0.01;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S2Oracle_1ToS1Oracle_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "S1Oracle_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Oracle_0ToFrame_1ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_1ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_2ReconS2OracleToFrame_2ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS2Oracle";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ToFrame_2ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2";
    postLayerName                       = "Frame_2ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorMuggleToS1Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S1Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_0ToFrame_1_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_1";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

S2Diff_1ToS1Oracle_2ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "S1Oracle_2ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_1ReconS2OracleToFrame_1ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS2Oracle";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_2ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_2ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_2ToS1Oracle_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "S1Oracle_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Oracle_1ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_1ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S2Oracle_2ToFrame_5_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_5";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3_ATA";
};

S2Oracle_1ToFrame_4ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_4ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S1Oracle_2ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_2ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_5ReconS1MuggleToFrame_5ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS1Muggle";
    postLayerName                       = "Frame_5ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_1ToFrame_1ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_1";
    postLayerName                       = "Frame_1ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Oracle_0ToFrame_2ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S1Oracle_0ToFrame_0ReconErrorOracle";
    dWMax                               = 0.01;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S1Oracle_3ToFrame_5_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_5";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2_ATA";
};

S1Muggle_1ReconErrorMuggleToS1Muggle_1 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_1ReconErrorMuggle";
    postLayerName                       = "S1Muggle_1";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorMuggleToS1Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S1Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_1ToFrame_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Muggle_2ToFrame_5ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "Frame_5ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Oracle_0ToFrame_3ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S2Muggle_2ToFrame_4ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "Frame_4ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_4ReconErrorMuggleToS2Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorMuggle";
    postLayerName                       = "S2Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Muggle_1ToFrame_4ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "Frame_4ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Oracle_0ToS1Oracle_1ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "S1Oracle_1ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S1Muggle_3ToFrame_4ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_3";
    postLayerName                       = "Frame_4ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_0ReconS2MuggleToS1Oracle_0ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_0ReconS2Muggle";
    postLayerName                       = "S1Oracle_0ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_1ToFrame_2ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_2ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_2ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Muggle_2ToFrame_3ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "Frame_3ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_1ReconS1MuggleToFrame_1ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS1Muggle";
    postLayerName                       = "Frame_1ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_1ToFrame_3_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2_ATA";
};

S1Oracle_0ToFrame_2_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

Frame_0ReconS2OracleToFrame_0ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS2Oracle";
    postLayerName                       = "Frame_0ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Muggle_1ToFrame_3ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "Frame_3ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_3ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Muggle_0ToFrame_3ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "Frame_3ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

Frame_4ToFrame_4ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Diff_0ToFrame_3ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "Frame_3ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S1Oracle_3ReconS2OracleToS1Oracle_3ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_3ReconS2Oracle";
    postLayerName                       = "S1Oracle_3ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToFrame_1ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_1ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_2ReconErrorMuggleToS2Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S2Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S1Diff_1ToFrame_2ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_1";
    postLayerName                       = "Frame_2ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Muggle_1ToFrame_2ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "Frame_2ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Diff_1ToFrame_2ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "Frame_2ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Muggle_0ToFrame_2ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "Frame_2ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Diff_0ToS1Oracle_1ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "S1Oracle_1ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Muggle_0ToS1Muggle_0ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "S1Muggle_0ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Muggle_2ReconS2MuggleToS1Oracle_2ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_2ReconS2Muggle";
    postLayerName                       = "S1Oracle_2ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1OracleClone_1ToS1Oracle_1ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "S1Oracle_1ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_2_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0_ATA";
};

Frame_1ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_1ReconS1OracleToFrame_1ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS1Oracle";
    postLayerName                       = "Frame_1ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Muggle_0ToFrame_1ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "Frame_1ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_0ToS1Oracle_1ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "S1Oracle_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 10;
    nyp                                 = 10;
    nfp                                 = 4;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S2Muggle_1ToS2Diff_1 = {
groupType = "IdentConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "S2Diff_1";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconErrorOracleToS1Oracle_3 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorOracle";
    postLayerName                       = "S1Oracle_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_1ToS1Diff_1 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_1";
    postLayerName                       = "S1Diff_1";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Diff_0ToFrame_0ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "Frame_0ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S2Muggle_2ToS1Muggle_3ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "S1Muggle_3ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S1Muggle_3ReconErrorMuggleToS2Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_3ReconErrorMuggle";
    postLayerName                       = "S2Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Diff_2ToS1Oracle_3ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "S1Oracle_3ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Muggle_2ToS1Muggle_2ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "S1Muggle_2ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

Frame_1ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_3ReconErrorOracleToS1Oracle_3 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S1Oracle_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_2ReconErrorMuggleToS2Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_2ReconErrorMuggle";
    postLayerName                       = "S2Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Oracle_0ToFrame_1_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_1";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

S2Diff_2ToS1Oracle_2ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "S1Oracle_2ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Oracle_1ReconS2OracleToS1Oracle_1ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_1ReconS2Oracle";
    postLayerName                       = "S1Oracle_1ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Muggle_1ToS1Muggle_2ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "S1Muggle_2ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_5ReconS2OracleToFrame_5ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS2Oracle";
    postLayerName                       = "Frame_5ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconErrorOracleToS1Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorOracle";
    postLayerName                       = "S1Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_0ReconErrorMuggleToS1Muggle_0 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_0ReconErrorMuggle";
    postLayerName                       = "S1Muggle_0";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Muggle_1ToS1Muggle_1ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "S1Muggle_1ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Diff_1ToFrame_1ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_1";
    postLayerName                       = "Frame_1ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_1ReconErrorMuggleToS1Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorMuggle";
    postLayerName                       = "S1Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Muggle_0ToS1Muggle_1ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "S1Muggle_1ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_2ReconErrorOracleToS1Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S1Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_1ToFrame_1_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_1";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0_ATA";
};

S1OracleClone_2ToS1Oracle_2ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "S1Oracle_2ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_1ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_1ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S1Oracle_3ToS1Diff_3 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "S1Diff_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_5ReconS2MuggleToFrame_5ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS2Muggle";
    postLayerName                       = "Frame_5ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Diff_0ToS1Oracle_0ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "S1Oracle_0ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

Frame_2ReconS2MuggleToFrame_2ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS2Muggle";
    postLayerName                       = "Frame_2ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Muggle_1ToFrame_1ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_1";
    postLayerName                       = "Frame_1ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_2ToFrame_2ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_2";
    postLayerName                       = "Frame_2ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_1ReconS2MuggleToS1Oracle_1ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_1ReconS2Muggle";
    postLayerName                       = "S1Oracle_1ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconErrorOracleToS1Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_0ReconErrorOracle";
    postLayerName                       = "S1Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_0ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_0ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

Frame_5ReconS2MuggleToFrame_5ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS2Muggle";
    postLayerName                       = "Frame_5ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS2OracleToFrame_4ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS2Oracle";
    postLayerName                       = "Frame_4ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS2MuggleToFrame_4ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS2Muggle";
    postLayerName                       = "Frame_4ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS2MuggleToFrame_4ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS2Muggle";
    postLayerName                       = "Frame_4ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_0ReconS2OracleToS1Oracle_0ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_0ReconS2Oracle";
    postLayerName                       = "S1Oracle_0ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconS2MuggleToFrame_3ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS2Muggle";
    postLayerName                       = "Frame_3ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_3_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1_ATA";
};

Frame_3ReconS2MuggleToFrame_3ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS2Muggle";
    postLayerName                       = "Frame_3ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorMuggleToS1Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S1Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_1ToFrame_1_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_1";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0_ATA";
};

Frame_2ReconS2OracleToFrame_2ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS2Oracle";
    postLayerName                       = "Frame_2ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconS2MuggleToFrame_2ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS2Muggle";
    postLayerName                       = "Frame_2ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconS2OracleToFrame_1ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS2Oracle";
    postLayerName                       = "Frame_1ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconS2MuggleToFrame_1ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS2Muggle";
    postLayerName                       = "Frame_1ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconS2MuggleToFrame_1ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS2Muggle";
    postLayerName                       = "Frame_1ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorMuggleToS1Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorMuggle";
    postLayerName                       = "S1Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_0ToS2Diff_0 = {
groupType = "IdentConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "S2Diff_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToFrame_3_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2_ATA";
};

S1Muggle_0ToS1Diff_0 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_0";
    postLayerName                       = "S1Diff_0";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconS2MuggleToFrame_0ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS2Muggle";
    postLayerName                       = "Frame_0ReconErrorXX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconS2MuggleToFrame_0ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS2Muggle";
    postLayerName                       = "Frame_0ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToS1Oracle_2ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "S1Oracle_2ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S1Oracle_2ToFrame_4ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1MuggleClone_3ToS1Muggle_3ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_3";
    postLayerName                       = "S1Muggle_3ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_2ReconS2MuggleToS1Muggle_2ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_2ReconS2Muggle";
    postLayerName                       = "S1Muggle_2ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconErrorOracleToS1Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorOracle";
    postLayerName                       = "S1Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_2ReconS2OracleToS1Oracle_2ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_2ReconS2Oracle";
    postLayerName                       = "S1Oracle_2ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1MuggleClone_2ToS1Muggle_2ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_2";
    postLayerName                       = "S1Muggle_2ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_1ReconS2MuggleToS1Muggle_1ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_1ReconS2Muggle";
    postLayerName                       = "S1Muggle_1ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_1ReconS2OracleToS1Oracle_1ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_1ReconS2Oracle";
    postLayerName                       = "S1Oracle_1ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Diff_0ToFrame_1ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_0";
    postLayerName                       = "Frame_1ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Oracle_1ToFrame_3ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_3ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Muggle_0ReconS2MuggleToS1Muggle_0ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_0ReconS2Muggle";
    postLayerName                       = "S1Muggle_0ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Diff_1ToFrame_4ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "Frame_4ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Muggle_0ToS2Diff_0 = {
groupType = "IdentConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "S2Diff_0";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_3ReconS2OracleToS1Oracle_3ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_3ReconS2Oracle";
    postLayerName                       = "S1Oracle_3ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_0ToFrame_0ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_0";
    postLayerName                       = "Frame_0ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_0ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_0ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_1ToFrame_4_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_4";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3_ATA";
};

Frame_3ToFrame_3ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3";
    postLayerName                       = "Frame_3ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToFrame_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_1ReconErrorMuggleToS2Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorMuggle";
    postLayerName                       = "S2Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_0ReconS2OracleToFrame_0ReconErrorXX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS2Oracle";
    postLayerName                       = "Frame_0ReconErrorXX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToFrame_4ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_4ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Diff_1ToFrame_1ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "Frame_1ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S2Diff_1ToS1Oracle_1ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_1";
    postLayerName                       = "S1Oracle_1ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S2Oracle_2ToS2Diff_2 = {
groupType = "IdentConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "S2Diff_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToFrame_1ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S1Oracle_2ToFrame_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_0ToS1Oracle_0ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "S1Oracle_0ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

Frame_5ToFrame_5ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5";
    postLayerName                       = "Frame_5ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_0ToFrame_3_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

S2Oracle_0ToS1Oracle_0ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "S1Oracle_0ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 10;
    nyp                                 = 10;
    nfp                                 = 4;
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
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S1Diff_2ToFrame_2ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_2";
    postLayerName                       = "Frame_2ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_3ReconS1MuggleToFrame_3ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS1Muggle";
    postLayerName                       = "Frame_3ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_4ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_4ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_4ToFrame_4ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4";
    postLayerName                       = "Frame_4ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconS1MuggleToFrame_0ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS1Muggle";
    postLayerName                       = "Frame_0ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_3ToFrame_5ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_3";
    postLayerName                       = "Frame_5ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_3ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_3ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_4ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

Frame_1ToFrame_1ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1";
    postLayerName                       = "Frame_1ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconErrorMuggleToS1Muggle_3 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorMuggle";
    postLayerName                       = "S1Muggle_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_2ToFrame_4ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_2";
    postLayerName                       = "Frame_4ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_2ToFrame_3_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1_ATA";
};

S1Oracle_0ReconErrorOracleToS1Oracle_0 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_0ReconErrorOracle";
    postLayerName                       = "S1Oracle_0";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_4ReconErrorMuggleToS1Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorMuggle";
    postLayerName                       = "S1Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Muggle_3ToFrame_3ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_3";
    postLayerName                       = "Frame_3ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Oracle_0ToFrame_0ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_0ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
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
    dWMax                               = 0.01;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S1Oracle_2ToS1Diff_2 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "S1Diff_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Diff_3ToFrame_3ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_3";
    postLayerName                       = "Frame_3ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_0ToFrame_0_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_0";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

S1Oracle_0ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_0ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1Muggle_2ToFrame_3ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_2";
    postLayerName                       = "Frame_3ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Diff_2ToFrame_3ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_2";
    postLayerName                       = "Frame_3ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_1ToFrame_3ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_1";
    postLayerName                       = "Frame_3ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Muggle_1ToFrame_2ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_1";
    postLayerName                       = "Frame_2ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Diff_2ToFrame_2ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "Frame_2ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_0ToFrame_2ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_0";
    postLayerName                       = "Frame_2ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Diff_0ToFrame_2ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_0";
    postLayerName                       = "Frame_2ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_1ReconErrorMuggleToS1Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorMuggle";
    postLayerName                       = "S1Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_0ToFrame_1ReconS1Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S1Muggle_0";
    postLayerName                       = "Frame_1ReconS1Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1MuggleClone_1ToS1Muggle_1ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_1";
    postLayerName                       = "S1Muggle_1ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_0ReconErrorMuggleToS1Muggle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_0ReconErrorMuggle";
    postLayerName                       = "S1Muggle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_3ReconErrorOracleToS1Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S1Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Diff_0ToFrame_0ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_0";
    postLayerName                       = "Frame_0ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_3ReconErrorMuggleToS1Muggle_3 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_3ReconErrorMuggle";
    postLayerName                       = "S1Muggle_3";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_5ReconS1MuggleToFrame_5ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS1Muggle";
    postLayerName                       = "Frame_5ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS1MuggleToFrame_4ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS1Muggle";
    postLayerName                       = "Frame_4ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_5ReconS1OracleToFrame_5ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS1Oracle";
    postLayerName                       = "Frame_5ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorOracleToS1Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S1Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_0ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_0ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_4ReconS1MuggleToFrame_4ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS1Muggle";
    postLayerName                       = "Frame_4ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconS1OracleToFrame_4ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS1Oracle";
    postLayerName                       = "Frame_4ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_0ToFrame_0_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_0";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 9;
    nyp                                 = 9;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

Frame_3ReconS1MuggleToFrame_3ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS1Muggle";
    postLayerName                       = "Frame_3ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconS1OracleToFrame_3ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS1Oracle";
    postLayerName                       = "Frame_3ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconS1MuggleToFrame_2ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS1Muggle";
    postLayerName                       = "Frame_2ReconErrorX";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconS1OracleToFrame_2ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS1Oracle";
    postLayerName                       = "Frame_2ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ReconS1MuggleToFrame_1ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS1Muggle";
    postLayerName                       = "Frame_1ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorMuggleToS2Muggle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S2Muggle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

Frame_0ReconS1MuggleToFrame_0ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS1Muggle";
    postLayerName                       = "Frame_0ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_1ToFrame_1ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_1ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Muggle_2ReconErrorMuggleToS1Muggle_2 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_2ReconErrorMuggle";
    postLayerName                       = "S1Muggle_2";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ReconS2OracleToS1Oracle_2ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_2ReconS2Oracle";
    postLayerName                       = "S1Oracle_2ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ReconErrorOracleToS1Oracle_2 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_2ReconErrorOracle";
    postLayerName                       = "S1Oracle_2";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_2ToS1Diff_2 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_2";
    postLayerName                       = "S1Diff_2";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToFrame_2_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1_ATA";
};

S2Muggle_0ToFrame_0ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_0";
    postLayerName                       = "Frame_0ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_0ToFrame_0ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_0ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S1Oracle_3ToFrame_3ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_3ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_5ReconS1OracleToFrame_5ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5ReconS1Oracle";
    postLayerName                       = "Frame_5ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

Frame_3ReconErrorOracleToS1Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorOracle";
    postLayerName                       = "S1Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_2ToFrame_4_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_4";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2_ATA";
};

S1Oracle_1ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_1ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Oracle_1ToFrame_2ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_2ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S1Oracle_1ToFrame_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_0ToFrame_1ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S2Diff_2ToFrame_5ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "Frame_5ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Muggle_2ToFrame_2ReconS2Muggle = {
groupType = "CloneConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "Frame_2ReconS2Muggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_1ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_1ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_2ToS1Oracle_3ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "S1Oracle_3ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Muggle_2ToS2Diff_2 = {
groupType = "IdentConn";
    preLayerName                        = "S2Muggle_2";
    postLayerName                       = "S2Diff_2";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_3ToFrame_5ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_5ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

Frame_4ReconS1OracleToFrame_4ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_4ReconS1Oracle";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

Frame_0ToFrame_0ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0";
    postLayerName                       = "Frame_0ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_3ReconErrorMuggleToS1Muggle_3 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_3ReconErrorMuggle";
    postLayerName                       = "S1Muggle_3";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S1Oracle_1ToFrame_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Diff_3ToFrame_5ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_3";
    postLayerName                       = "Frame_5ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_1ToFrame_1ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_5ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_5ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Oracle_0ToFrame_0ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_0ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_2ReconS1OracleToFrame_2ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2ReconS1Oracle";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Diff_2ToFrame_4ReconErrorX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Diff_2";
    postLayerName                       = "Frame_4ReconErrorX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_3ReconErrorOracleToS1Oracle_3 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_3ReconErrorOracle";
    postLayerName                       = "S1Oracle_3";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToFrame_2_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0_ATA";
};

Frame_1ReconS1OracleToFrame_1ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1ReconS1Oracle";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_2ToFrame_3ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_2";
    postLayerName                       = "Frame_3ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1MuggleClone_0ToS1Muggle_0ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_0";
    postLayerName                       = "S1Muggle_0ReconErrorMuggle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_3ToFrame_5ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_5ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_1ReconErrorOracleToS1Oracle_1 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_1ReconErrorOracle";
    postLayerName                       = "S1Oracle_1";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_5ToFrame_5ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_5";
    postLayerName                       = "Frame_5ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_1ToFrame_1ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_1";
    postLayerName                       = "Frame_1ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToFrame_5ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_5ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S1Oracle_3ToFrame_3_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_3";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0_ATA";
};

Frame_3ReconS1OracleToFrame_3ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS1Oracle";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_4ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_4ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_2ToFrame_4ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_0ToFrame_0ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_0ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

S2Oracle_1ToFrame_4ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S2Oracle_2ToFrame_3ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_3ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S2Oracle_1ToFrame_3ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_3ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_1ToFrame_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_3ToFrame_4_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_4";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1_ATA";
};

Frame_0ReconS1OracleToFrame_0ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_0ReconS1Oracle";
    postLayerName                       = "Frame_0ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ReconErrorOracleToS2Oracle_0 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S2Oracle_0";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S2Oracle_0ToFrame_3ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_3ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_3ReconErrorOracle";
};

S1Oracle_2ReconErrorOracleToS2Oracle_2 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Oracle_2ReconErrorOracle";
    postLayerName                       = "S2Oracle_2";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S2Oracle_2ToFrame_2ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_0ReconErrorOracle";
};

Frame_2ReconErrorOracleToS2Oracle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "Frame_2ReconErrorOracle";
    postLayerName                       = "S2Oracle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S1Muggle_2ReconErrorMuggleToS2Muggle_1 = {
groupType = "TransposeConn";
    preLayerName                        = "S1Muggle_2ReconErrorMuggle";
    postLayerName                       = "S2Muggle_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = true;
    updateGSynFromPostPerspective       = true;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    gpuGroupIdx                         = -1;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

S2Oracle_0ToFrame_2ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_2ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_1ToFrame_2_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1_ATA";
};

S2Oracle_0ToFrame_2ReconErrorOracle = {
groupType = "MomentumConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = -1;
    wMaxInit                            = 1;
    sparseFraction                      = 0.9;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = nil;
    weightUpdatePeriod                  = 500;
    initialWeightUpdateTime             = 500;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "normalizeGroup";
    normalizeGroupName                  = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
    dWMax                               = 0.005;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
    momentumMethod                      = "viscosity";
    momentumTau                         = 200;
    momentumDecay                       = 0;
};

S2Diff_0ToFrame_1ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_0";
    postLayerName                       = "Frame_1ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S1OracleClone_0ToS1Oracle_0ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "S1Oracle_0ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

Frame_2ToFrame_2ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_2";
    postLayerName                       = "Frame_2ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_2ToS1Oracle_2ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "S1Oracle_2ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S1OracleClone_3ToS1Oracle_3ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "S1Oracle_3ReconErrorOracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_3ReconS2MuggleToS1Muggle_3ReconErrorMuggle = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_3ReconS2Muggle";
    postLayerName                       = "S1Muggle_3ReconErrorMuggle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_1ToS1Diff_1 = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_1";
    postLayerName                       = "S1Diff_1";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_1ToS1Oracle_1ReconS2Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "S1Oracle_1ReconS2Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S2Oracle_1ToS1Oracle_1ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_1";
    postLayerName                       = "S1Oracle_1ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_0ReconErrorOracle";
};

S2Oracle_2ToFrame_4_ATA = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "Frame_4";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_2_ATA";
};

S2Oracle_2ToS1Oracle_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Oracle_2";
    postLayerName                       = "S1Oracle_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToS1Oracle_1ReconErrorOracle";
};

Frame_3ReconS2OracleToFrame_3ReconErrorOracle = {
groupType = "IdentConn";
    preLayerName                        = "Frame_3ReconS2Oracle";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S2Oracle_0ToFrame_2_ATA = {
groupType = "HyPerConn";
    preLayerName                        = "S2Oracle_0";
    postLayerName                       = "Frame_2";
    channelCode                         = -1;
    delay                               = {0.000000};
    numAxonalArbors                     = 1;
    plasticityFlag                      = true;
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    sharedWeights                       = true;
    weightInitType                      = "UniformRandomWeight";
    initWeightsFile                     = nil;
    wMinInit                            = 0;
    wMaxInit                            = 0;
    sparseFraction                      = 0;
    minNNZ                              = 0;
    initializeFromCheckpointFlag        = false;
    triggerLayerName                    = "Frame_0";
    triggerOffset                       = 0;
    immediateWeightUpdate               = true;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    writeStep                           = -1;
    writeCompressedCheckpoints          = false;
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    nxp                                 = 18;
    nyp                                 = 18;
    nfp                                 = 1;
    shrinkPatches                       = false;
    normalizeMethod                     = "none";
    dWMax                               = 1;
    normalizeDw                         = true;
    useMask                             = false;
    dWMaxDecayInterval                  = 0;
    dWMaxDecayFactor                    = 0;
    weightSparsity                      = 0;
};

S2Diff_2ToFrame_3ReconErrorXX = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S2Diff_2";
    postLayerName                       = "Frame_3ReconErrorXX";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S2Oracle_0ToFrame_1ReconErrorOracle";
};

S1Oracle_0ToFrame_1ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_1ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Oracle_0ReconS2OracleToS1Oracle_0ReconErrorX = {
groupType = "IdentConn";
    preLayerName                        = "S1Oracle_0ReconS2Oracle";
    postLayerName                       = "S1Oracle_0ReconErrorX";
    channelCode                         = 0;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Muggle_3ToS1Diff_3 = {
groupType = "IdentConn";
    preLayerName                        = "S1Muggle_3";
    postLayerName                       = "S1Diff_3";
    channelCode                         = 1;
    delay                               = {0.000000};
    initWeightsFile                     = nil;
    weightSparsity                      = 0;
};

S1Oracle_0ToFrame_2ReconS1Oracle = {
groupType = "CloneConn";
    preLayerName                        = "S1Oracle_0";
    postLayerName                       = "Frame_2ReconS1Oracle";
    channelCode                         = 0;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_2ReconErrorOracle";
};

S1Oracle_3ToFrame_4ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_4ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_1ReconErrorOracle";
};

S1Oracle_3ToFrame_3ReconErrorOracle = {
groupType = "PlasticCloneConn";
    preLayerName                        = "S1Oracle_3";
    postLayerName                       = "Frame_3ReconErrorOracle";
    channelCode                         = -1;
    delay                               = {0.000000};
    convertRateToSpikeCount             = false;
    receiveGpu                          = false;
    updateGSynFromPostPerspective       = false;
    pvpatchAccumulateType               = "convolve";
    selfFlag                            = false;
    combine_dW_with_W_flag              = false;
    useMask                             = false;
    weightSparsity                      = 0;
    originalConnName                    = "S1Oracle_0ToFrame_0ReconErrorOracle";
};

EnergyProbe = {
groupType = "ColumnEnergyProbe";
    message                             = nil;
    textOutputFlag                      = true;
    probeOutputFile                     = "EnergyProbe.txt";
    triggerLayerName                    = nil;
    energyProbe                         = nil;
    reductionInterval                   = 0;
};

S1Oracle_2ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Oracle_2ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_0ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_0ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_1ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Muggle_1ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Oracle_1ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Oracle_1ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_3ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Muggle_3ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Oracle_0ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Oracle_0ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_3ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_3ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Oracle_3ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Oracle_3ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_2FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Muggle_2";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

Frame_2ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_2ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S2Muggle_2FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Muggle_2";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

Frame_5ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_5ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_3FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Muggle_3";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

S2Oracle_1FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Oracle_1";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

Frame_0ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_0ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_1ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_1ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_5ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_5ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Oracle_1FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Oracle_1";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

S1Muggle_0ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Muggle_0ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_1ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_1ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_1FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Muggle_1";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

Frame_4ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_4ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_0FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Muggle_0";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

Frame_3ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_3ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

Frame_2ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_2ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Oracle_0FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Oracle_0";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

S2Muggle_1FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Muggle_1";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

S1Oracle_2FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Oracle_2";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

Frame_4ReconErrorOracleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "Frame_4ReconErrorOracle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S1Muggle_2ReconErrorMuggleL2Probe = {
groupType = "L2NormProbe";
    targetLayer                         = "S1Muggle_2ReconErrorMuggle";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    coefficient                         = 0.5;
    maskLayerName                       = nil;
    exponent                            = 2;
};

S2Muggle_0FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Muggle_0";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

S2Oracle_0FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Oracle_0";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

S2Oracle_2FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S2Oracle_2";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.2;
    VWidth                              = 0;
};

S1Oracle_3FirmThreshProbe = {
groupType = "FirmThresholdCostFnLCAProbe";
    targetLayer                         = "S1Oracle_3";
    message                             = nil;
    textOutputFlag                      = false;
    triggerLayerName                    = nil;
    energyProbe                         = "EnergyProbe";
    maskLayerName                       = nil;
    VThresh                             = 0.4;
    VWidth                              = 0;
};

} --End of pvParameters

-- Print out PetaVision approved parameter file to the console
paramsFileString = pv.createParamsFileString(pvParameters)
io.write(paramsFileString)
