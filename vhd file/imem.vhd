----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:50 05/18/2021 
-- Design Name: 
-- Module Name:    imem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_textio.all;

entity imem is
generic (
	datafile: string := "c:\test01.asc" );
port (  clk: in std_logic;
	reset: in std_logic;
	iaddr: in std_logic_vector(31 downto 0);
	idata: out std_logic_vector(31 downto 0));
end imem;

architecture imem_arch of imem is

	constant mbegin: natural := 0;				
	constant mend: natural := 16384-1;
	constant ibegin: natural := 4096;			
	subtype word is std_logic_vector(31 downto 0);
	type memory is array (natural range mbegin to mend) of word;

begin

   process
		variable mem: memory;
		variable ia: natural;

		procedure load(mem: out memory) is
			file ifile: text is in "test01.asc";
			variable l: line;
			variable c: character;
			variable d: std_logic_vector(31 downto 0);
			variable i, j: natural;
		begin
			write(output, "instruction memory initialization");
			for i in mbegin to mend loop
				mem(i) := conv_std_logic_vector(0, 32);
			end loop;
			i := ibegin;
			while (not endfile(ifile)) loop
				readline(ifile, l);
				d := conv_std_logic_vector(0, 32);
				for j in 0 to 7 loop
				
					read(l, c);
					if (c = 'F' or c = 'f') then
						d := d(27 downto 0) & "1111";
					elsif (c = 'E' or c = 'e') then
						d := d(27 downto 0) & "1110";
					elsif (c = 'D' or c = 'd') then
						d := d(27 downto 0) & "1101";
					elsif (c = 'C' or c = 'c') then
						d := d(27 downto 0) & "1100";
					elsif (c = 'B' or c = 'b') then
						d := d(27 downto 0) & "1011";
					elsif (c = 'A' or c = 'a') then
						d := d(27 downto 0) & "1010";
					elsif (c = '9') then
						d := d(27 downto 0) & "1001";
					elsif (c = '8') then
						d := d(27 downto 0) & "1000";
					elsif (c = '7') then
						d := d(27 downto 0) & "0111";
					elsif (c = '6') then
						d := d(27 downto 0) & "0110";
					elsif (c = '5') then
						d := d(27 downto 0) & "0101";
					elsif (c = '4') then
						d := d(27 downto 0) & "0100";
					elsif (c = '3') then
						d := d(27 downto 0) & "0011";
					elsif (c = '2') then
						d := d(27 downto 0) & "0010";
					elsif (c = '1') then
						d := d(27 downto 0) & "0001";
					elsif (c = '0') then
						d := d(27 downto 0) & "0000";
					elsif (c /= '#') then
						write(output, "non-hexadecimal character found");
					end if;
					mem(i) := d;
				end loop;
				i := i + 1;
			end loop;
		end load;

	begin

		load(mem);
		loop
		   wait on clk, reset, iaddr;
			
			if (reset = '0') then
				if (iaddr > (mend+1)*4-4 or iaddr < mbegin*4) then
					
					assert false severity failure;
				end if;
				if (iaddr(1 downto 0) /= "00") then
					
					assert false severity failure;
				end if;
			end if;
		       	ia := conv_integer(unsigned(iaddr(31 downto 2)));
		       	idata <= mem(ia);
		end loop;

	end process;

end imem_arch;
