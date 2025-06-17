`timescale 1ns / 1ps
module LinesCheck(
    h_cnt_Q, v_cnt_Q,
    vtx1_X, vtx1_Y, vtx1_Z,
    vtx2_X, vtx2_Y, vtx2_Z,
    vtx3_X, vtx3_Y, vtx3_Z,
    vtx4_X, vtx4_Y, vtx4_Z,
    onLine1, onLine2, onLine3, onLine4, onLine5, onLine6
    );
    ///////////////////////////////////////////////////////////////IO setup
    input signed[15:0] h_cnt_Q, v_cnt_Q;
    //vtx=vertex(頂點)
    input signed[15:0]
        vtx1_X, vtx1_Y, vtx1_Z,
        vtx2_X, vtx2_Y, vtx2_Z,
        vtx3_X, vtx3_Y, vtx3_Z,
        vtx4_X, vtx4_Y, vtx4_Z;
    output onLine1, onLine2, onLine3, onLine4, onLine5, onLine6;
    ///////////////////////////////////////////////////////////////IO setup end
    //null
    //null
    ///////////////////////////////////////////////////////////////line1 check
    LineCheck uLine1(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx1_X), .vtxA_Y(vtx1_Y),
        .vtxB_X(vtx2_X), .vtxB_Y(vtx2_Y),
        .onLine(onLine1)
    );
    ///////////////////////////////////////////////////////////////line1 check end
    //null
    //null
    ///////////////////////////////////////////////////////////////line2 check
    LineCheck uLine2(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx1_X), .vtxA_Y(vtx1_Y),
        .vtxB_X(vtx3_X), .vtxB_Y(vtx3_Y),
        .onLine(onLine2)
    );
    ///////////////////////////////////////////////////////////////line2 check end
    //null
    //null
    ///////////////////////////////////////////////////////////////line3 check
    LineCheck uLine3(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx1_X), .vtxA_Y(vtx1_Y),
        .vtxB_X(vtx4_X), .vtxB_Y(vtx4_Y),
        .onLine(onLine3)
    );
    ///////////////////////////////////////////////////////////////line3 check end
    //null
    //null
    ///////////////////////////////////////////////////////////////line4 check
    LineCheck uLine4(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx2_X), .vtxA_Y(vtx2_Y),
        .vtxB_X(vtx3_X), .vtxB_Y(vtx3_Y),
        .onLine(onLine4)
    );
    ///////////////////////////////////////////////////////////////line4 check end
    //null
    //null
    ///////////////////////////////////////////////////////////////line5 check
    LineCheck uLine5(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx2_X), .vtxA_Y(vtx2_Y),
        .vtxB_X(vtx4_X), .vtxB_Y(vtx4_Y),
        .onLine(onLine5)
    );
    ///////////////////////////////////////////////////////////////line5 check end
    //null
    //null
    ///////////////////////////////////////////////////////////////line6 check
    LineCheck uLine6(
        .h_cnt_Q(h_cnt_Q), .v_cnt_Q(v_cnt_Q),
        .vtxA_X(vtx3_X), .vtxA_Y(vtx3_Y),
        .vtxB_X(vtx4_X), .vtxB_Y(vtx4_Y),
        .onLine(onLine6)
    );
    ///////////////////////////////////////////////////////////////line6 check end
endmodule
