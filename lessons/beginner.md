## Introduction (Hands-On)

## Functions

-   Write a function:

    function[A] = areaOfCircle(r)
        A = pi * r^2;

-   Save this file as `areaOfCircle.m`.  Test it on some values, then on `1:1:5`.  What needs to be fixed?

-   Compose a new function, `volumeOfSphere`, and make it work properly.

## Matrix solution

![Truss image](https://raw.githubusercontent.com/uiuc-cse/matlab-fa14/gh-pages/lessons/img/truss.png)

![Matrix equation](https://raw.githubusercontent.com/uiuc-cse/matlab-fa14/gh-pages/lessons/img/truss-matrix.png)

## Exercise

[Exercises](https://raw.githubusercontent.com/uiuc-cse/matlab-fa14/gh-pages/lessons/exercises-beginner.pdf)

## Vectorization

-   Write a script:

    `a=-9.8; %m/s^2`
    
    `v=2520; %m/s`
    
    `x0=0;`
    
    `t=1;`
    
    `y=a*t^2+v*t+x0;`

## Functions

One equation for the volume rate of flow of water Q over the spillway of a dam is the formula

Q = C √(2g) B (H + v^2/(2g))^1.5

where C is the discharge coefficient; B is the spillway width; and H is the depth of water passing over the spillway.

-   Open the file [`computedamrateofflow.m`](https://raw.githubusercontent.com/uiuc-cse/matlab-fa14/gh-pages/lessons/computedamrateofflow.m).  This has skeleton code for a function you will now create.
-   Define a discharge coefficient of 1.946 and the acceleration due to gravity in SI units.
-   Calculate the value of Q.  This should be in the form Q = <something>.
-   Plot your function for B = 1m, v = 0.536m/s (the flow rate of the Mississippi river) against a vector H ranging from 1 to 10 at increments of 0.1.
-   What would you change to make this also a function of discharge coefficient C?

## Scripts and file operations

T_F(T_C) = T_C 180/100 + 32

