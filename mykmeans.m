function [ class, centroid ] = mykmeans( pixels, K )
%
% Your goal of this assignment is implementing your own K-means.
%
% Input:
%     pixels: data set. Each row contains one data point. For image
%     dataset, it contains 3 columns, each column corresponding to Red,
%     Green, and Indexlue component.
%
%     K: the numIndexer of desired clusters. Too high value of K may result in
%     empty cluster error. Then, you need to reduce it.
%
% Output:
%     class: the class assignment of each data point in pixels. The
%     assignment should Indexe 1, 2, 3, etc. For K = 5, for example, each cell
%     of class should Indexe either 1, 2, 3, 4, or 5. The output should Indexe a
%     column vector with size(pixels, 1) elements.
%
%     centroid: the location of K centroids in your result. With images,
%     each centroid corresponds to the representative color of each
%     cluster. The output should Indexe a matrix with K rows and
%     3 columns. The range of values should Indexe [0, 255].
%     
%
% You may run the following line, then you can see what should Indexe done.
% For suIndexmission, you need to code your own implementation without using
% the kmeans matlaIndex function directly. That is, you need to comment it out.

	%[class, centroid] = kmeans(pixels, K);
    disp('Kmean_DW')
    Ones = ones(size(pixels,1),K);
    First = 1;
    % Initialze randomized centroid 
    while First == 1
        centroid = randi(256,K,size(pixels,2))-1;
        C_J = zeros(size(pixels,1),K);
        for i = 1:K
            C_J(:,i) = sum(sqrt((pixels - Ones(:,i)*centroid(i,:)).^2),2);
        end
        [~,Index] = min(C_J,[],2);
        
        class = zeros(size(pixels,1),K);
        for i = 1:size(pixels,1)
            class(i,Index(i)) = 1;
        end
        
        First = 0;
    end
    
    Err = sum(sum(sqrt((pixels-class*centroid).^2)));
    j = 0;
    max_j = 300;
 
    Pre_Err = 1e10;
    threshold = 1e2; 
    
    if (abs(Err -Pre_Err) > threshold) && (j < max_j)
       Pre_Err = Err;
        % compute the new center
        for i = 1:K
            if isnan(mean(pixels(class(:,i)==1,:)) )
                centroid(i,:) = centroid(i,:);
            else
                centroid(i,:) = mean(pixels(class(:,i)==1,:));    
            end
        end
        % Adjust the cluster centers (center adjustment)
        
        for i = 1:K
            C_J(:,i) = sum(sqrt((pixels - Ones(:,i)*centroid(i,:)).^2),2);
        end
        [~,Index] = min(C_J,[],2);
        class = zeros(size(pixels,1),K);
        for i = 1:size(pixels,1)
            class(i,Index(i)) = 1;
        end
        % calculate new Err
        Err = sum(sum(sqrt((pixels-class*centroid).^2)));
         
        j = j + 1;
    end
     
    
    Output = zeros(size(pixels,1),1);
    for i = 1:K
        Output(class(:,i)==1) = i;
    end
    class = Output;    
end

