function [ class, centroid ] = mykmedoids( pixels, K )
%
% Your goal of this assignment is implementing your own K-medoids.
% Please refer to the instructions carefully, and we encourage you to
% consult with other resources about this algorithm on the web.
%
% Input:
%     pixels: data set. Each row contains one data point. For image
%     dataset, it contains 3 columns, each column corresponding to Red,
%     Green, and Blue component.
%
%     K: the number of desired clusters. Too high value of K may result in
%     empty cluster error. Then, you need to reduce it.
%
% Output:
%     class: the class assignment of each data point in pixels. The
%     assignment should be 1, 2, 3, etc. For K = 5, for example, each cell
%     of class should be either 1, 2, 3, 4, or 5. The output should be a
%     column vector with size(pixels, 1) elements.
%
%     centroid: the location of K centroids in your result. With images,
%     each centroid corresponds to the representative color of each
%     cluster. The output should be a matrix with K rows and
%     3 columns. The range of values should be [0, 255].
%     
%
% You may run the following line, then you can see what should be done.
% For submission, you need to code your own implementation without using
% the kmeans matlab function directly. That is, you need to comment it out.

	[class, centroid] = kmedoids(pixels, K);
    if 0
    mydata = pixels;
    myK = K;
    [N, F] = size(pixels);
    NumofIter = 300;
    
    %Initialize the initial clusters randomly 
    Index = randi(K,1,N)+1;
    Cluster = mydata(Index,:);
    
    %Partition Around Medoids Algorithm 
    %Initialize: select k of the n data points as the medoids
    %Associate each data point to the closest medoid.
    %While the cost of the configuration decreases:
        %For each medoid m, for each non-medoid data point o:
            %Swap m and o, associate each data point to the closest medoid, recompute the cost (sum of distances of points to their medoid)
            %If the total cost of the configuration increased in the previous step, undo the swap 
    
    %Storing the cost for each iteration
    mycost = zeros(NumofInter,1);
    
    X = zeros(myK,F, N);
    for i = 1:N
        X(:,:,i) = repmat(mydata(i,:),myK,1);
    end
    
    total_cost = 0; 
    Ini =1;
    
    for i = 1:NumofIter
        %Initial round, compute the cost associated 
        if (Ini)
            Miu = repmat(Cluster,[1 1 myK]);
            % Euclidean distance
            D = sqrt(sum(abs(X-Miu).^2,2));
        end   
    end
    end
end