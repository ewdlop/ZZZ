```python
def solve_system_z5(equations):
    """
    Solves a system of linear equations in Z5.
    
    Args:
        equations (list of tuples): Each tuple is (a, b, c), representing ax + by ≡ c mod 5.
    
    Returns:
        dict: Solutions for x and y in Z5, or None if no solution exists.
    """
    from sympy import Matrix
    
    # Build coefficient matrix and RHS vector
    coeff_matrix = []
    rhs = []
    for eq in equations:
        coeff_matrix.append(eq[:2])
        rhs.append(eq[2])
    
    # Solve the system
    mod = 5
    A = Matrix(coeff_matrix).applyfunc(lambda x: x % mod)
    B = Matrix(rhs).applyfunc(lambda x: x % mod)
    
    try:
        # Solve Ax = B mod 5
        solution = A.inv_mod(mod) * B
        return {f"x{i+1}": int(solution[i]) % mod for i in range(len(solution))}
    except ValueError:
        return None  # No solution if matrix is singular

# Example usage
equations = [
    (2, 3, 4),  # 2x + 3y ≡ 4 mod 5
    (1, 4, 2)   # x + 4y ≡ 2 mod 5
]
solution = solve_system_z5(equations)
print(f"Solution to the system is: {solution}")
```
