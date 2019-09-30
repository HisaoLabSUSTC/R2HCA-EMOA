function [Population,worst,tensor] = Reduce(Global,Population,W,worst,tensor,r,row)
% Delete one solution from the population

%--------------------------------------------------------------------------
% Author: Ke Shang
% Version: 0.1
% The paper has been submitted to TEVC.
% The code uses PlatEMO published in "Ye Tian, Ran Cheng, Xingyi Zhang, 
% and Yaochu Jin, PlatEMO: A MATLAB Platform for Evolutionary 
% Multi-Objective Optimization [Educational Forum], IEEE Computational 
% Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------  
        
    %% Update tensor
    PopObj    = Population.objs;
    fmax   = max(PopObj,[],1);
    fmin   = min(PopObj,[],1);
    PopObj  = (PopObj-repmat(fmin,size(PopObj,1),1))./repmat(fmax-fmin,size(PopObj,1),1);
    tensor = UpdateUtilityTensor(Global,PopObj,worst,r,tensor,W,row);

    %% Identify the last front and calculate the HVC approximation
    FrontNo    = NDSort(PopObj,Global.N+1);
    LastFront = find(FrontNo==max(FrontNo));
    N = length(LastFront);
    if N > 1 && N < Global.N+1
        %% Extract tensor1 from tensor
        tensor1 = zeros(N,row,N);
        for i=1:N
            temp = tensor(:,:,LastFront(i)); 
            if i==1
                tensor1(:,:,i)=temp([LastFront(i+1:end)-1,end],:);
            elseif i==N
                tensor1(:,:,i)=temp([LastFront(1:i-1),end],:);
            else
                tensor1(:,:,i)=temp([LastFront(1:i-1),LastFront(i+1:end)-1,end],:);
            end
        end
        deltaS = CalR2HVC(Global.M,tensor1);
    elseif N==1
        deltaS = 0;
    else
        deltaS = CalR2HVC(Global.M,tensor);
    end
    
    %% Delete the worst solution from the last front
    [~,worst] = min(deltaS);
    Population(LastFront(worst)) = [];
    worst = LastFront(worst);
end