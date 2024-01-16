% r < 0
assert(S_geo(10, -0.5) <= 2/3)
% r = 0
assert(S_geo(10, 0) == 1)
% 0 < r < 1
assert(S_geo(10, 0.5) <= 2)
% r = 1
assert(isnan(S_geo(10, 1)))
% r > 1
assert(S_geo(10, 1.5) >= 113)