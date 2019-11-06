function [sr alr] = root_MUSIC(YY,k,B)

%% 
% YY = Signal Snapshots/Samples
% k = Number of true features
% B = Number of blocks
%%

[L ~] = size(YY);
R = YY*YY'/(L*B); % Covariance of data matrix
[eigvec eigvals] = eig(R);

%% Computing coefficients for polynomial construction
En = eigvec(:,1:L-k); % noise eigenspace
A = En*En';
cf = zeros(L-1,1);
for i=1:L-1
    cf(i) = sum(diag(A,i));
end
% Complete set of coefficients
CF = [flipud(cf); sum(diag(A)); conj(cf)];

% Computing roots 
rts = roots(CF);
% Finding roots inside the unit circle and refining the roots
candidates = true(length(rts),1);
% for i=1:length(rts)
%     if abs(rts(i))>1
%         candidates(i) = false;
%     elseif abs(rts(i)) == 1
%         % closest root from this particular root will be removed
%         d = inf;
%         for j=1:length(rts)
%             if candidates(j) && j~=1
%                 d_temp = abs(rts(j)-rts(i));
%                 if d_temp<d
%                     d = d_temp;
%                     id = j;
%                 end
%             end
%         end
%         candidates(id) = false; %removing the closest component
%     end
% end

% Alternative root processing
candidates(find(abs(rts)>1)) = false;
rts(find(abs(rts)>1)) = 0;
[~,ind] = maxk(abs(rts),k);

% true_rts = rts(candidates);
% [~,ind] = maxk(true_rts,k);
true_rts = rts(ind);
%% From roots to transmitted code
% sr = angle(true_rts(ind))*L/(2*pi);
sr = wrapTo2Pi(angle(true_rts));
alr = wrapTo2Pi(angle(rts));
end