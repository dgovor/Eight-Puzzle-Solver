function h = manh_dist(A,B)

h = 0;

for i = 1:size(A,1)
    for j = 1:size(A,2)
        if A(i,j) ~= 0
            [ii,jj] = find(B == A(i,j));
            h = h + abs(ii - i) + abs(jj - j);
        end
    end
end