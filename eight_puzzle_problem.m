clc;
clear;
close all;

% A = [2 4 3; 1 5 6; 8 0 7];
% B = [1 2 3; 8 0 4; 7 6 5];

% A = [4 7 5; 2 0 6; 8 3 1];
% B = [1 4 7; 2 5 8; 3 6 0];

disp('Input example:')
disp('2 4 3')
disp('1 5 6')
disp('8 0 7')

try
    fprintf('\nInput initial state row by row. Each element is separated by space or comma.\n')
    str = convertCharsToStrings(input('','s'));
    A = str2num(str{1});
    str = convertCharsToStrings(input('','s'));
    A = [A; str2num(str{1})];
    str = convertCharsToStrings(input('','s'));
    A = [A; str2num(str{1})];
    
    if numel(unique(A)) ~= 9
        disp('Initial state is incorrect')
        error('Invalid input')
    end
    
    fprintf('\nInput goal state row by row. Each element is separated by space or comma.\n')
    str = convertCharsToStrings(input('','s'));
    B = str2num(str{1});
    str = convertCharsToStrings(input('','s'));
    B = [B; str2num(str{1})];
    str = convertCharsToStrings(input('','s'));
    B = [B; str2num(str{1})];
    
    if numel(unique(B)) ~= 9
        disp('Goal state is incorrect')
        error('Invalid input')
    end
    
    if sum(A,'all') ~= sum(B,'all')
        error('Invalid input')
    end
    
    fprintf('\nWrite 1 to use Manhattan distance or 2 to use Number of misplaced tiles.\n')
    n = input('');
    
    tic
    
    switch n
        case 1
            [A,M,k] = puzzle_manh_dist(A,B);
        case 2
            [A,M,k] = puzzle_misplaced(A,B);
        otherwise error('Invalid input')
    end
    
    fprintf('\n')
    disp('Final result:')
    disp(num2str(A(1,:)))
    disp(num2str(A(2,:)))
    disp(num2str(A(3,:)))
    
    fprintf('\n')
    toc
    name = ['Number of iterations: ', num2str(k)];
    disp(name)

catch
    fprintf('\nInvalid input\n')
end