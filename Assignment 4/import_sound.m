function [x,f] = import_sound(fileName)
% Input fileName
% This function imports a file from the path, the path has to be specified
% indiviually for each user, I don't know enough about matlab to avoid this
[x,f] = audioread([fileName]);
end