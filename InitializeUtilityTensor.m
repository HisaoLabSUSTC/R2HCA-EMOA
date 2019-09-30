function tensor = InitializeUtilityTensor(Global,PopObj,W,r,row)
% Utility tensor initialization

%--------------------------------------------------------------------------
% Author: Ke Shang
% Version: 0.1
% The paper has been submitted to TEVC.
% The code uses PlatEMO published in "Ye Tian, Ran Cheng, Xingyi Zhang, 
% and Yaochu Jin, PlatEMO: A MATLAB Platform for Evolutionary 
% Multi-Objective Optimization [Educational Forum], IEEE Computational 
% Intelligence Magazine, 2017, 12(4): 73-87".
%-------------------------------------------------------------------------- 

    data = PopObj;
    r = r*max(data,[],1);
    PopNum = Global.N+1;
    
    tensor = zeros(Global.N+1,row,Global.N+1);
    
    for i=1:PopNum-1
        data1 = data;
        s = data1(i,:);
        data1(i,:)=[];
        
        if isempty(data1)
           data1 = 0; 
        end
            
        utilityPoints = zeros(PopNum-1,row);
        for j = 1:row
            currWeights = repmat(W(j,:), PopNum-1, 1);
            utilityPoints(:,j) = max((data1-s)./currWeights,[],2);
        end
        
        temp1 = min(abs(s-r)./W,[],2)';        
        tensor(:,:,i) = [utilityPoints;temp1];     
    end
end