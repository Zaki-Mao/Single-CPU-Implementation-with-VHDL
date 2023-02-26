----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:25:40 05/18/2021 
-- Design Name: 
-- Module Name:    scpu_top - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scpu_top is
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC);
end scpu_top;


architecture Behavioral of scpu_top is

component scpu
port(
	clk : in STD_LOGIC;
	reset : in STD_LOGIC;
	idata : in STD_LOGIC_VECTOR(31 downto 0);
	ddataout : in STD_LOGIC_VECTOR(31 downto 0);
	iaddr : out STD_LOGIC_VECTOR(31 downto 0);
	ddatain : out STD_LOGIC_VECTOR(31 downto 0);
	daddr : out STD_LOGIC_VECTOR(31 downto 0);
	we : out STD_LOGIC;
	oe : out STD_LOGIC);
end component;

component imem
generic (
	datafile: string := "program.asc" );
port (  clk: in std_logic;
	reset: in std_logic;
	iaddr: in std_logic_vector(31 downto 0);
	idata: out std_logic_vector(31 downto 0));
end component;

component dmem
port (
	clk: in std_logic;
	reset: in std_logic;
	daddr: in std_logic_vector(31 downto 0);
	ddatain: in std_logic_vector(31 downto 0);
	ddataout: out std_logic_vector(31 downto 0);
	oe: in std_logic;
	we: in std_logic );
end component;

--connection for imem
signal scpu_to_imem : STD_LOGIC_VECTOR(31 downto 0);
signal imem_to_scpu : STD_LOGIC_VECTOR(31 downto 0);

--connection for dmem
signal scpu_to_dmem_daddr : STD_LOGIC_VECTOR(31 downto 0);
signal scpu_to_dmem_ddatain : STD_LOGIC_VECTOR(31 downto 0);
signal scpu_to_dmem_oe : STD_LOGIC;
signal scpu_to_dmem_we : STD_LOGIC;
signal dmem_to_scpu : STD_LOGIC_VECTOR(31 downto 0);

--connection for scpu
--signal scpu_to_imem
--signal imem_to_scpu
signal temp_clk : STD_LOGIC := clk;
signal temp_reset : STD_LOGIC := reset;
--signal scpu_to_dmem_daddr
--signal scpu_to_dmem_ddatain
--signal scpu_to_dmem_oe
--signal scpu_to_dmem_we
--signal dmem_to_scpu


begin
myscpu : scpu PORT MAP (temp_clk, temp_reset, imem_to_scpu, dmem_to_scpu, scpu_to_imem, scpu_to_dmem_ddatain, scpu_to_dmem_daddr, scpu_to_dmem_we, scpu_to_dmem_oe);
myimem : imem PORT MAP (temp_clk, temp_reset, scpu_to_imem, imem_to_scpu);
mydmem : dmem PORT MAP (temp_clk, temp_reset, scpu_to_dmem_daddr, scpu_to_dmem_ddatain, dmem_to_scpu, scpu_to_dmem_oe, scpu_to_dmem_we);


end Behavioral;
