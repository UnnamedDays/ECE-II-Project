// PDF의 회로 코드를 여기에 직접 작성하고 저장하세요.
// 파일명을 바꾸거나 하위 모듈을 추가하면 simulation.json의 sources도 수정하세요.

module logic_gate (
    input wire a,
    input wire b,
    output wire x,
    output wire y,
    output wire z
);

    assign x = a & b; // AND gate
    assign y = a | b; // OR gate
    assign z = a ^ b; // XOR gate


endmodule
