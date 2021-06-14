function h = misplaced(A,B)

if find(~A) == find(~B)
    h = sum(A ~= B, 'all');
else
    h = sum(A ~= B, 'all') - 1;
end