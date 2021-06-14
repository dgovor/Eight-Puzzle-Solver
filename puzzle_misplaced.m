function [A,M,k] = puzzle_misplaced(A,B)

k = 0;
g = 0;
M = {0};
index = 1;
h = misplaced(A,B);

while h ~= 0
    [i,j] = find(~A);
    g = g + 1;
    k = k + 1;
    depth = 0;
    
    if i ~= 1
        M{index,1} = A;
        M{index,1}(i,j) = A(i-1,j);
        M{index,1}(i-1,j) = 0;
        M{index,2} = g;
        M{index,3} = misplaced(M{index,1},B);
        M{index,4} = M{index,2} + M{index,3};
        index = index + 1;
    end
    
    if i ~= 3
        M{index,1} = A;
        M{index,1}(i,j) = A(i+1,j);
        M{index,1}(i+1,j) = 0;
        M{index,2} = g;
        M{index,3} = misplaced(M{index,1},B);
        M{index,4} = M{index,2} + M{index,3};
        index = index + 1;
    end
    
    if j ~= 1
        M{index,1} = A;
        M{index,1}(i,j) = A(i,j-1);
        M{index,1}(i,j-1) = 0;
        M{index,2} = g;
        M{index,3} = misplaced(M{index,1},B);
        M{index,4} = M{index,2} + M{index,3};
        index = index + 1;
    end
    
    if j ~= 3
        M{index,1} = A;
        M{index,1}(i,j) = A(i,j+1);
        M{index,1}(i,j+1) = 0;
        M{index,2} = g;
        M{index,3} = misplaced(M{index,1},B);
        M{index,4} = M{index,2} + M{index,3};
        index = index + 1;
    end
    
    f_vector = [M{:,4}];
    
    depth = find(f_vector == min(f_vector));
    for i = 1:size(depth,2)
        depth(2,i) = M{depth(1,i),2};
    end
    
    [~,I] = min(depth(2,:));
    I = depth(1,I);
    
    A = M{I,1};
    g = M{I,2};
    h = M{I,3};
    M{I,5} = k;
    
    for i = 1:size(M,1)
        if misplaced(M{i,1},A) == 0
            M{i,4} = NaN;
        end
    end
end