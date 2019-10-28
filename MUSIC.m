function gains = MUSIC(YY,u,ZC)

%%
% YY = Signal matrix with B observations/snapshots as B columns
% u = Number of sinusoids/features
% ZC = Parameter search space. For DOA estimation, each columns are
% potential array steering vectors

% Performing MUSIC
B = size(YY,2);
R = YY*YY'/B; %covariance matrix
[eigvec eigval] = eig(R); %Eigen decomposition
% Sorting Eigenvectors and Eigenvalues
[val ind] = sort(diag(eigval),1,'descend'); %sorting all the eigenvalues
eigvec = eigvec(:,ind); %Sorting all the eigenvectors in descending order
eigs = eigvec(:,1:u);
eign = eigvec(:,u+1:end);
% Computing spectrum
for i=1:U
    gains(i) = (ZC(:,i)'*ZC(:,i))/(ZC(:,i)'*(eign*eign')*ZC(:,i));
end
%         plot(abs(gains))