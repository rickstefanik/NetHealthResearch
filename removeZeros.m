function A = removeZeros(B)

count = 1;
for i = 1:length(B)
   if (B(i) ~= 0)
      A(count) = B(i);
      count = count + 1;
   end
end