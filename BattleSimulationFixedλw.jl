# Initial Conditions 
λ = 3.0 
w = 0.25 
R0 = 5.0 
B0 = 2.0 

max_steps = 100  
tolerance = 1e-6         
 
println("n\tR_n\t\tB_n") 
println("0\t", R0, "\t", B0) 
 
for n in 1:max_steps 
    R_new = R0 - λ*w*0.05*B0 - λ*0.005*R0*B0 
    B_new = B0 - w*0.05*R0 - 0.005*R0*B0 
 
    println(n, "\t", round(R_new, digits=6), "\t", round(B_new, digits=6)) 
 
    # Second infinite loop safeguard 
    if R_new <= tolerance || B_new <= tolerance 
        R0 = R_new 
        B0 = B_new 
        println("\nBattle ends at hour ", n) 
        break 
    end 
 
    R0 = R_new 
    B0 = B_new 
end 
 
# WAR  
if B0 <= tolerance && R0 > tolerance 
    println("Red wins.") 
    println("Remaining red divisions: ", round(R0, digits=6)) 
elseif R0 <= tolerance && B0 > tolerance 
    println("Blue wins.") 
    println("Remaining blue divisions: ", round(B0, digits=6)) 
else 
    println("Mutual destruction or draw.") 
end 

#= Terminal Output:  
n       R_n             B_n 
0       5.0     	      2.0 
1       4.775           1.8875 
2       4.569027        1.782748 
3       4.379992        1.684908 
4       4.20611 	      1.593259 
5       4.045841        1.507176 
6       3.897855        1.426114 
7       3.760994        1.349597 
8       3.634247        1.277205 
9       3.516727        1.208569 
10      3.407652        1.143358 
11      3.306334        1.081282 
12      3.212159        1.022077 
13      3.124585        0.96551 
14      3.043127        0.911369 
15      2.967349        0.859462 
16      2.896864        0.809619 
17      2.831323        0.761681 
18      2.770412        0.715507 
19      2.713846        0.670966 
20      2.661372        0.627938 
21      2.612756        0.586315 
22      2.567791        0.545996 
23      2.526286        0.506889 
24      2.48807 	      0.468907 
25      2.452986        0.431973 
26      2.420892        0.396013 
27      2.391661        0.360958 
28      2.365176        0.326746 
29      2.341331        0.293317 
30      2.32003 	      0.260617 
31      2.301187        0.228593 
32      2.284725        0.197198 
33      2.270572        0.166386 
34      2.258665        0.136115 
35      2.248949        0.106345 
36      2.241374        0.077037 
37      2.235895        0.048156 
38      2.232474        0.019669 
39      2.231078       -0.008456 
  
Battle ends at hour 39 
Red wins. 
Remaining red divisions: 2.231078 
=#
