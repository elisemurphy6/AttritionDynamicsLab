## Varied λ and w
function simulate_battle(λ, w; R0=5.0, B0=2.0, max_steps=1000, tol=1e-10) 
    R = R0 
    B = B0 
 
    for n in 1:max_steps 
        R_new = R - λ*w*0.05*B - λ*0.005*R*B 
        B_new = B - w*0.05*R - 0.005*R*B 
 
        if B_new <= tol && R_new > tol 
            return (hours=n, winner="Red", remaining=R_new) 
        elseif R_new <= tol && B_new > tol 
            return (hours=n, winner="Blue", remaining=B_new) 
        elseif R_new <= tol && B_new <= tol 
            return (hours=n, winner="Mutual destruction", remaining=0.0) 
        end 
 
        R = R_new 
        B = B_new 
    end 
 
    return (hours=max_steps, winner="No decision", remaining=NaN) 
end 
 
λ_values = [1.5, 2.0, 4.0, 5.0] 
w_values = [0.1, 0.2, 0.25, 0.5, 0.75, 0.9] 
 
for λ in λ_values 
    println("\nλ = ", λ) 
    println("w\tHours\tWinner\tRemaining") 
    for w in w_values 
        result = simulate_battle(λ, w) 
        println(w, "\t", result.hours, "\t", result.winner, "\t", round(result.remaining, digits=6)) 
    end 
end 

#=
Terminal Output:  
λ = 1.5 
w       Hours   Winner  Remaining 
0.1     58      Red     3.300421 
0.2     34      Red     3.621465 
0.25    29      Red     3.712444 
0.5     16      Red     3.936032 
0.75    11      Red     4.020499 
0.9     9       Red     4.048828 
  
λ = 2.0 
w       Hours   Winner  Remaining 
0.1     66      Red     2.696761 
0.2     38      Red     3.12752 
0.25    31      Red     3.250341 
0.5     17      Red     3.553693 
0.75    12      Red     3.669651 
0.9     10      Red     3.705707 
  
λ = 4.0 
w       Hours   Winner  Remaining 
0.1     107     Blue    0.513385 
0.2     113     Red     0.366721 
0.25    66      Red     0.843551 
0.5     26      Red     1.700655 
0.75    16      Red     2.004983 
0.9     13      Red     2.105675 
  
λ = 5.0 
w       Hours   Winner  Remaining 
0.1     61      Blue    0.897969 
0.2     46      Blue    0.747725 
0.25    43      Blue    0.676626 
0.5     36      Blue    0.335966 
0.75    28      Red     0.579307 
0.9     20      Red     0.849049 
=#
