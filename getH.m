function H = getH(dim,PopNum)
% Generate H which is used in the reference point specification

%--------------------------------------------------------------------------
% Author: Ke Shang
% Version: 0.1
% The paper has been submitted to TEVC.
% The code uses PlatEMO published in "Ye Tian, Ran Cheng, Xingyi Zhang, 
% and Yaochu Jin, PlatEMO: A MATLAB Platform for Evolutionary 
% Multi-Objective Optimization [Educational Forum], IEEE Computational 
% Intelligence Magazine, 2017, 12(4): 73-87".
%-------------------------------------------------------------------------- 

    for H=1:100
       N = nchoosek(H+dim-1,dim-1); 
       if N>PopNum
           break;
       end
    end
    H = H-1;
end