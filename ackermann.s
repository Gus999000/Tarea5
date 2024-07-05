.section .text
.global ackermann
.type ackermann, %function
ackermann:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    cmp w0, 0
    bne manejar_m_no_es_cero

    add w0, w1, 1
    b retornar_ackermann

manejar_m_no_es_cero:
    cmp w1, 0
    bne manejar_n_no_es_cero

    sub w0, w0, 1
    mov w1, 1
    bl ackermann
    b retornar_ackermann

manejar_n_no_es_cero:
    sub w1, w1, 1
    mov x2, x0
    bl ackermann
    mov w1, w0
    mov x0, x2
    sub w0, w0, 1
    bl ackermann

retornar_ackermann:
    ldp x29, x30, [sp], 16
    ret

.size ackermann, .-ackermann