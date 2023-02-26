-- TestBench Template 

 library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity scpu_tb is
end scpu_tb;

architecture scpu_tb_arch of scpu_tb is
  
COMPONENT scpu_top PORT (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC);
end COMPONENT;


signal clk : STD_LOGIC;
signal reset : std_logic;


begin
   
   process
      begin
         loop
           clk <= '1';
           wait for 5 ns;
           clk <= '0';
           wait for 5 ns;
         end loop;
   end process;
    
   process
      begin
           reset <= '1';
           wait for 2 ns;
           reset <= '0';
			  wait;
   end process;

   scpu0: scpu_top port map (
       clk   => clk,
       reset => reset);


end scpu_tb_arch;
