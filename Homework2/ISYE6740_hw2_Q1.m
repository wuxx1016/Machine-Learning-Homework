clear all
subject14=[];

% Read the pics
pic=imread('subject14.gif');
[num_row, num_col] = size(pic);
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.glasses.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.happy.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.leftlight.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.noglasses.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];


pic=imread('subject14.rightlight.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.normal.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.sad.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.sleepy.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

pic=imread('subject14.wink.gif');
pic = reshape(pic,1,[]);
subject14=[subject14; pic];

sub14_mean = mean(subject14);

h = imshow(mat2gray(reshape(sub14_mean,num_row,num_col)));
saveas(h,sprintf('Sub14meanFIG%d.png'));

sub14_mean = double(sub14_mean);
subject14 = double(subject14);


temdiff = zeros(size(subject14));
[m,n]= size(subject14);
for i=1:m   
    temdiff(i,:)=subject14(i,:)-sub14_mean;

end
commatrix=temdiff*temdiff';
[v,d]=eigs(commatrix); % size
v_first = v(:,1);
size(v_first)


for i = 1:6
    enignface = temdiff'*v(:,i);
    h = imshow(mat2gray(reshape(enignface,num_row,num_col)));
    saveas(h,sprintf('Sub14FIG%d.png',i));
end

%% 
subject01=[];

pic=imread('subject01.gif');
[num_row, num_col] = size(pic);
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.glasses.gif');
pic = reshape(pic,1,[]);
% size(pic)
subject01=[subject01; pic];

pic=imread('subject01.happy.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.leftlight.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.noglasses.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];


pic=imread('subject01.rightlight.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.normal.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.sad.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.sleepy.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.wink.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];

pic=imread('subject01.surprised.gif');
pic = reshape(pic,1,[]);
subject01=[subject01; pic];


sub1_mean = mean(subject01);

k = imshow(mat2gray(reshape(sub1_mean,num_row,num_col)));
saveas(k,sprintf('Sub14FIG%d.png'));


sub1_mean = double(sub1_mean);
subject01 = double(subject01);

temdiff2 = zeros(size(subject01));
[m2,n1]= size(subject01);
for i=1:m2  
    temdiff2(i,:)=subject01(i,:)-sub1_mean;
end

commatrix2=temdiff2*temdiff2';
[v2,d2]=eigs(commatrix2);
v_second = v2(:,1);


for i = 1:6
    enignface = temdiff2'*v2(:,i);
    k=imshow(mat2gray(reshape(enignface,num_row,num_col)));  
    saveas(k,sprintf('Sub01FIG%d.png',i));
end

%%
test=imread(strcat('subject14.test.gif'));

test = reshape(test,1,[]);
test = double(test);

v_first = temdiff' * v_first;
v_second = temdiff2' * v_second;

output1 = dot(test,v_first)/norm(v_first)

output2 = dot(test,v_second)/norm(v_second)






