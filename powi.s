.text
.global powi
.type powi, %function
powi:
    stp     x29, x30, [sp, -16]!  // Save frame pointer and return address
    mov     x29, sp               // Update frame pointer

    str     w0, [x29, -20]        // Store first argument (base) in stack
    str     w1, [x29, -24]        // Store second argument (exp) in stack
    mov     w0, #1                // Initialize result to 1
    str     w0, [x29, -4]         // Store result in stack

    b       L2                    // Jump to L2

L3:
    ldr     w0, [x29, -4]         // Load current result
    ldr     w1, [x29, -20]        // Load base
    mul     w0, w0, w1            // Multiply result by base
    str     w0, [x29, -4]         // Store new result

L2:
    ldr     w0, [x29, -24]        // Load exp
    sub     w0, w0, #1            // Decrement exp
    str     w0, [x29, -24]        // Store new exp
    cbnz    w0, L3                // If exp != 0, jump to L3

    ldr     w0, [x29, -4]         // Load final result
    ldp     x29, x30, [sp], 16    // Restore frame pointer and return address
    ret                           // Return
    .size   powi, .-powi