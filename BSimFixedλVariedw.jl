## Part (ii): λ = 3.0, vary w 
 
function simulate_battle(λ, w; R0=5.0, B0=2.0, max_steps=1000, tol=1e-10) 
    R = R0 
    B = B0 
 
    for n in 1:max_steps 
        R_new = R - λ*w*0.05*B - λ*0.005*R*B 
        B_new = B - w*0.05*R - 0.005*R*B 
 
        if B_new <= tol && R_new > tol 
            return (w=w, hours=n, winner="Red", remaining=R_new) 
        elseif R_new <= tol && B_new > tol 
            return (w=w, hours=n, winner="Blue", remaining=B_new) 
        elseif R_new <= tol && B_new <= tol 
            return (w=w, hours=n, winner="Both eliminated", remaining=0.0) 
        end 
 
        R = R_new 
        B = B_new 
    end 
 
    return (w=w, hours=max_steps, winner="No decision", remaining=NaN) 
end 
 
λ = 3.0 
w_values = [0.10, 0.20, 0.25, 0.50, 0.75, 0.90] 
 
println("w\tHours\tWinner\tRemaining divisions") 
for w in w_values 
    result = simulate_battle(λ, w) 
    println(result.w, "\t", result.hours, "\t", result.winner, "\t", round(result.remaining, digits=6)) 
end  
#= 
Terminal Output:  
w       Hours   Winner  Remaining divisions 
0.1     102     Red     1.340911 
0.2     49      Red     2.034051 
0.25    39      Red     2.231078 
0.5     20      Red     2.719173 
0.75    13      Red     2.908514 
0.9     11      Red     2.968915 
=#
