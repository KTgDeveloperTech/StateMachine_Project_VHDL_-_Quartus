library ieee;
use ieee.std_logic_1164.all;

entity StateMachine is
port 
(

   clk : in std_logic;

  sw   : in std_logic_vector ( 3 downto 1);
 led   : out std_logic_vector( 3 downto 1)
);

end entity;

architecture rtl of SwitchDriveLed is 

type datatypestatemachine is (STATE1,STATE2,STATE3);
 
 signal statevariable :datatypestatemachine;
 begin
  
  process1: process(clk) 
begin

 if rising_edge (clk) then
 
 case statevariable is
 
      when STATE1 =>
		 led(1) <= '110';-- enable led 1, disable the others
		 if sw(1) = '0' then 
		 statevariable <= STATE2;
		 end if;
		 
		when STATE2 =>
		 led(2) <= '101'; --enable led 2, disable the others
		 if sw(2) = '0' then
		 statevariable <= STATE3;
		 end if;
		 
		when STATE3 =>
		 led(3) <= '011'; --enable led 3, disable the others
		 if sw(3) = '0' then
		 statevariable <= STATE1;
		 end if;
		 
		when others =>
       statevariable <= STATE1;
		 
		 
	end case;	
	
  end if;
  
 end process;
 
end rtl;

end architecture;
