function A = normalizeArr(B)
    A = ((B - min(B)) / ((max(B) - (min(B)))));
end