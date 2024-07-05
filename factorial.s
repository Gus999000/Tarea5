.text
.global factorial
.type factorial, %function
factorial:
    stp     x29, x30, [sp, -16]!  // Save frame pointer and return address
    mov     x29, sp               // Update frame pointer

    str     w0, [x29, -20]        // Store first argument (n) in stack
    mov     w0, #1                // Initialize result to 1
    str     w0, [x29, -4]         // Store result in stack
    b       L2                    // Jump to L2

L3:
    ldr     w0, [x29, -4]         // Load current result
    ldr     w1, [x29, -20]        // Load current n
    mul     w0, w0, w1            // Multiply result by n
    str     w0, [x29, -4]         // Store new result
    ldr     w0, [x29, -20]        // Load current n
    sub     w0, w0, #1            // Decrement n
    str     w0, [x29, -20]        // Store new n

L2:
    ldr     w0, [x29, -20]        // Load current n
    cmp     w0, #1                // Compare n with 1
    b.gt    L3                    // If n > 1, jump to L3

    ldr     w0, [x29, -4]         // Load final result
    ldp     x29, x30, [sp], 16    // Restore frame pointer and return address
    ret                           // Return
    .size   factorial, .-factorial