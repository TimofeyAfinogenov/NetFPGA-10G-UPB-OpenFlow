/*
 * Copyright (c) 2014, 2015 Thomas Löcke
 * tloecke@mail.uni-paderborn.de
 *
 * This file is part of the NetFPGA 10G UPB OpenFlow Switch project:
 *
 * Project Group "On-the-Fly Networking for Big Data"
 * SFB 901 "On-The-Fly Computing"
 *
 * University of Paderborn
 * Computer Engineering Group
 * Pohlweg 47 - 49
 * 33098 Paderborn
 * Germany
 *
 * 
 * This file is free code: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License version 2.1 as
 * published by the Free Software Foundation.
 *
 * This file is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this project. If not, see <http://www.gnu.org/licenses/>.
 * 
 * Description: encode and decode functions used for tkeep
 */


function [4:0] encode;
  input [31:0] number;
  reg [5:0] i;
  begin
    encode = 31;
    for (i = 31; i > 0; i = i - 1) begin
      if (number[i] == 1'b0) begin
        encode = i - 1;
      end
    end
  end
endfunction

function [31:0] decode;
  input [4:0] number;
  reg [5:0] i;
  begin
    for (i = 0; i <= 31; i = i + 1) begin
      if (i == number)
        decode = (2**(i + 1)) - 1;
    end
  end
endfunction
