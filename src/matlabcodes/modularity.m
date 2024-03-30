function Q = modularity(A, g)
%% MODULARITY computes the modularity of the of the partition in group g of the
% graph with adjacency matrix A.

nCommunities = numel(unique(g));
nNodes = length(g);

e = zeros(nCommunities);
for i = 1:nNodes
    for j = 1:nNodes
        e(g(i), g(j)) = e(g(i), g(j)) + A(i, j);
    end
end
nEdges = sum(A(:));  % we could use nnz(A), but we want to take into account weights
a_out = sum(e, 2);   % out-degree
a_in = (sum(e, 1))'; % in-degree
a = a_in.*a_out/nEdges^2;
Q = trace(e)/nEdges - sum(a);

end