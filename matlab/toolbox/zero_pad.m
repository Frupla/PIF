function s = zero_pad(vector1, vector2)
if(isrow(vector1) && isrow(vector(2)))
    if(length(vector1) <= length(vector2))
        s = [vector1 zeros(1, length(vector2)-length(vector1))];
    else
        s = [vector2 zeros(1, length(vector1)-length(vector2))];
    end
end
if(length(vector1) <= length(vector2))
    s = [vector1; zeros(length(vector2)-length(vector1),1)];
else
    s = [vector2; zeros(length(vector1)-length(vector2),1)];
end
