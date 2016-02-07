% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 602.222561859478787 ; 592.539231299340827 ];

%-- Principal point:
cc = [ 296.752827234656706 ; 232.993856129170752 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.233067891531607 ; 0.149811944656940 ; -0.006799815961638 ; -0.002012649812396 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 10.810771030991997 ; 11.091302081076941 ];

%-- Principal point uncertainty:
cc_error = [ 20.435221468411115 ; 19.503288429415974 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.079051224841389 ; 0.251487491167784 ; 0.005442085679793 ; 0.005670663609381 ; 0.000000000000000 ];

%-- Image size:
nx = 640;
ny = 480;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.627651e+00 ; 1.644151e+00 ; -7.236354e-01 ];
Tc_1  = [ -8.477859e-01 ; -3.634898e-01 ; 4.038684e+00 ];
omc_error_1 = [ 2.854541e-02 ; 3.572075e-02 ; 4.377026e-02 ];
Tc_error_1  = [ 1.372983e-01 ; 1.342642e-01 ; 7.321123e-02 ];

%-- Image #2:
omc_2 = [ 1.827250e+00 ; 1.901107e+00 ; -4.062566e-01 ];
Tc_2  = [ -7.420374e-01 ; -7.670386e-01 ; 3.528834e+00 ];
omc_error_2 = [ 3.022572e-02 ; 3.505265e-02 ; 5.397925e-02 ];
Tc_error_2  = [ 1.205723e-01 ; 1.171130e-01 ; 7.293117e-02 ];

%-- Image #3:
omc_3 = [ 1.732354e+00 ; 2.085126e+00 ; -4.827403e-01 ];
Tc_3  = [ -5.926412e-01 ; -8.578328e-01 ; 3.596261e+00 ];
omc_error_3 = [ 2.817090e-02 ; 3.712339e-02 ; 5.700562e-02 ];
Tc_error_3  = [ 1.226612e-01 ; 1.193080e-01 ; 7.121620e-02 ];

%-- Image #4:
omc_4 = [ 1.839724e+00 ; 2.120481e+00 ; -1.114588e+00 ];
Tc_4  = [ -3.042290e-01 ; -7.465495e-01 ; 3.686018e+00 ];
omc_error_4 = [ 2.493866e-02 ; 3.896042e-02 ; 5.115477e-02 ];
Tc_error_4  = [ 1.256928e-01 ; 1.212776e-01 ; 5.610356e-02 ];

%-- Image #5:
omc_5 = [ 1.064575e+00 ; 1.928858e+00 ; -2.689720e-01 ];
Tc_5  = [ -4.110005e-01 ; -1.126336e+00 ; 3.470280e+00 ];
omc_error_5 = [ 2.390492e-02 ; 3.501343e-02 ; 4.079988e-02 ];
Tc_error_5  = [ 1.194856e-01 ; 1.156440e-01 ; 6.899184e-02 ];

%-- Image #6:
omc_6 = [ -1.724358e+00 ; -1.946472e+00 ; -7.496175e-01 ];
Tc_6  = [ -7.357630e-01 ; -3.706973e-01 ; 2.032345e+00 ];
omc_error_6 = [ 2.244728e-02 ; 3.658033e-02 ; 4.957650e-02 ];
Tc_error_6  = [ 6.941458e-02 ; 6.949135e-02 ; 6.022870e-02 ];

%-- Image #7:
omc_7 = [ 1.968384e+00 ; 1.910520e+00 ; 1.294034e+00 ];
Tc_7  = [ -3.692122e-01 ; -3.531569e-01 ; 1.935014e+00 ];
omc_error_7 = [ 4.198308e-02 ; 2.235298e-02 ; 5.096226e-02 ];
Tc_error_7  = [ 6.729945e-02 ; 6.532343e-02 ; 6.209765e-02 ];

%-- Image #8:
omc_8 = [ 1.942374e+00 ; 1.813823e+00 ; 1.308175e+00 ];
Tc_8  = [ -7.956044e-01 ; -4.782143e-01 ; 2.007260e+00 ];
omc_error_8 = [ 4.015569e-02 ; 2.254174e-02 ; 4.935782e-02 ];
Tc_error_8  = [ 7.317094e-02 ; 7.048936e-02 ; 6.927204e-02 ];

%-- Image #9:
omc_9 = [ -1.359314e+00 ; -1.972905e+00 ; 3.245396e-01 ];
Tc_9  = [ -3.667283e-03 ; -1.090845e+00 ; 3.354136e+00 ];
omc_error_9 = [ 2.813361e-02 ; 3.655954e-02 ; 4.554287e-02 ];
Tc_error_9  = [ 1.149455e-01 ; 1.112892e-01 ; 7.135025e-02 ];

%-- Image #10:
omc_10 = [ -1.502802e+00 ; -2.093589e+00 ; 2.591907e-01 ];
Tc_10  = [ -9.813509e-02 ; -1.451973e+00 ; 4.098344e+00 ];
omc_error_10 = [ 3.587494e-02 ; 4.316252e-02 ; 6.253416e-02 ];
Tc_error_10  = [ 1.431513e-01 ; 1.365226e-01 ; 9.806202e-02 ];

%-- Image #11:
omc_11 = [ -1.799884e+00 ; -2.071749e+00 ; -4.104111e-01 ];
Tc_11  = [ -7.377703e-01 ; -1.129290e+00 ; 3.245541e+00 ];
omc_error_11 = [ 3.267936e-02 ; 4.024799e-02 ; 6.941159e-02 ];
Tc_error_11  = [ 1.136121e-01 ; 1.138557e-01 ; 9.702116e-02 ];

%-- Image #12:
omc_12 = [ -1.879842e+00 ; -2.130255e+00 ; -4.490653e-01 ];
Tc_12  = [ -6.481795e-01 ; -8.652546e-01 ; 2.793227e+00 ];
omc_error_12 = [ 2.810303e-02 ; 3.862974e-02 ; 6.588094e-02 ];
Tc_error_12  = [ 9.713122e-02 ; 9.643792e-02 ; 8.330513e-02 ];

%-- Image #13:
omc_13 = [ -1.961471e+00 ; -2.164351e+00 ; -4.973687e-01 ];
Tc_13  = [ -6.492353e-01 ; -7.118364e-01 ; 2.549203e+00 ];
omc_error_13 = [ 2.615362e-02 ; 3.777886e-02 ; 6.471755e-02 ];
Tc_error_13  = [ 8.832234e-02 ; 8.735005e-02 ; 7.633319e-02 ];

%-- Image #14:
omc_14 = [ -1.979978e+00 ; -2.146924e+00 ; -5.128019e-01 ];
Tc_14  = [ -6.070819e-01 ; -6.712890e-01 ; 2.284865e+00 ];
omc_error_14 = [ 2.394806e-02 ; 3.640995e-02 ; 6.120426e-02 ];
Tc_error_14  = [ 7.927255e-02 ; 7.826061e-02 ; 6.764502e-02 ];

%-- Image #15:
omc_15 = [ -2.141805e+00 ; -2.282522e+00 ; -4.136382e-01 ];
Tc_15  = [ -9.918955e-01 ; -6.560817e-01 ; 2.226653e+00 ];
omc_error_15 = [ 2.753694e-02 ; 3.387927e-02 ; 6.633751e-02 ];
Tc_error_15  = [ 7.868243e-02 ; 7.810355e-02 ; 7.240654e-02 ];

%-- Image #16:
omc_16 = [ 1.875661e+00 ; 2.333079e+00 ; -1.828884e-01 ];
Tc_16  = [ -5.019448e-02 ; -8.147915e-01 ; 3.199847e+00 ];
omc_error_16 = [ 3.704798e-02 ; 3.690152e-02 ; 7.888087e-02 ];
Tc_error_16  = [ 1.096190e-01 ; 1.054348e-01 ; 8.328866e-02 ];

%-- Image #17:
omc_17 = [ -1.630774e+00 ; -1.968465e+00 ; -2.858729e-01 ];
Tc_17  = [ -6.648736e-01 ; -6.746693e-01 ; 2.281760e+00 ];
omc_error_17 = [ 2.322614e-02 ; 3.502256e-02 ; 4.859964e-02 ];
Tc_error_17  = [ 7.826017e-02 ; 7.749192e-02 ; 5.746051e-02 ];

%-- Image #18:
omc_18 = [ -1.347652e+00 ; -1.685613e+00 ; -2.651581e-01 ];
Tc_18  = [ -9.225747e-01 ; -7.635809e-01 ; 2.050222e+00 ];
omc_error_18 = [ 2.624700e-02 ; 3.324341e-02 ; 3.701166e-02 ];
Tc_error_18  = [ 7.122894e-02 ; 7.059201e-02 ; 5.383374e-02 ];

%-- Image #19:
omc_19 = [ -1.949326e+00 ; -1.856511e+00 ; -1.424199e+00 ];
Tc_19  = [ -5.111792e-01 ; -3.687075e-01 ; 1.458750e+00 ];
omc_error_19 = [ 2.203865e-02 ; 3.966920e-02 ; 4.917538e-02 ];
Tc_error_19  = [ 5.197698e-02 ; 5.092680e-02 ; 5.176132e-02 ];

%-- Image #20:
omc_20 = [ 1.868894e+00 ; 1.575925e+00 ; 1.465817e+00 ];
Tc_20  = [ -6.673459e-01 ; -4.052554e-01 ; 1.724205e+00 ];
omc_error_20 = [ 4.067279e-02 ; 2.279186e-02 ; 4.408558e-02 ];
Tc_error_20  = [ 6.371410e-02 ; 6.044460e-02 ; 6.171080e-02 ];

