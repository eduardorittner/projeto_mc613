module mapa (
  input cobra_clk,
  input cobra_write,
  input cobra_dado,
  input [9:0] cobra_x,
  input [9:0] cobra_y,

  input fruta_clk,
  input fruta_write,
  input fruta_dado,
  input [9:0] fruta_x,
  input [9:0] fruta_y
);

  parameter [1:0] NADA = 0;
  parameter [1:0] COBRA = 1;
  parameter [1:0] FRUTA = 2;

  // Mapa do jogo
  // 0 se não tem nada
  // 1 se tem cobra
  // 2 se tem fruta
  // 3 se tem outra cobra?
  reg [1:0] map [SCREEN_HEIGHT:0][SCREEN_WIDTH:0];

  always @(posedge cobra_clk) begin
    if (cobra_write) begin
      if (cobra_dado) begin
        map[cobra_y][cobra_x] <= COBRA;
      end else begin
        map[cobra_y][cobra_x] <= NADA;
      end
    end
  end

  always @(posedge fruta_clk) begin
    if (fruta_write) begin
      if (fruta_dado) begin
        map[fruta_y][fruta_x] <= FRUTA;
      end else begin
        map[fruta_y][fruta_x] <= NADA;
      end
    end
  end

endmodule
