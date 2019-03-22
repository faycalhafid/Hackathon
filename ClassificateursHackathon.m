% TrainSet=csvread('D:\Animals\DataSet\TrainSet.csv');
% TestSet=csvread('D:\Animals\DataSet\TestSet.csv');

% for i=1:25
%     knn=fitcknn(TrainSet(:,2:end),TrainSet(:,1),'NumNeighbors',i);
%     Labels_knn=predict(knn,TestSet(:,2:end));
%     acc_knn(i)=sum(Labels_knn==TestSet(:,1))/length(Labels_knn);
% end
% k=find(acc_knn==max(acc_knn)) %k=2
% max(acc_knn)                  % 92.98

for i=1:50
    Bagg=TreeBagger(i,TrainSet(:,2:end),TrainSet(:,1));
    Labels_Bagg=predict(Bagg,TestSet(:,2:end));
    Labels_Bagg=str2num(cell2mat(Labels_Bagg));
    acc_Bagg(i)=sum(Labels_Bagg==TestSet(:,1))/length(Labels_knn)
end
learners=find(acc_Bagg==max(acc_Bagg)) %k=2
acc_Bagg0=max(acc_Bagg)
figure(1)
plotconfusion(TestSet(:,1),Labels_knn)
figure(2)
Bagg=TreeBagger(learners,TrainSet(:,2:end),TrainSet(:,1));
Labels_Bagg=predict(Bagg,TestSet(:,2:end));
Labels_Bagg=predict(Bagg,TestSet(:,2:end));
Labels_Bagg=str2num(cell2mat(Labels_Bagg));
plotconfusion(TestSet(:,1),Labels_Bagg)