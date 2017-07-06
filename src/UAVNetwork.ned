//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

//
// Copyright (C) 2006 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import uavnet.node.UAVNode;
import inet.physicallayer.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

import ned.DatarateChannel;

//channel accessChannel extends DatarateChannel
//{
//    datarate = default(1 Gbps);
//    delay = default(0.1ms);
//    ber = default(0);
//    per = default(0);
//    @display("ls=blue,5");
//}

network UAVNetwork
{
    parameters:
        int numHosts = 5;
        int numRepeater;
    submodules:
        visualizer: <default("IntegratedCanvasVisualizer")> like IIntegratedVisualizer if hasVisualizer() {
            parameters:
                @display("p=100,50");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='192.168.1.x' netmask='255.255.255.0'/></config>");
                @display("p=100,150");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,250");
        }
        host[numHosts]: UAVNode {
            parameters:
                @display("r=,,#707070;p=250,60");
//            gates:
//                ethg[1];
        }
        
        repeater[numRepeater]: UAVNode {
            parameters:
                @display("r=,,#707070;p=250,120");
        }
        
//    connections:
//        host[0].ethg[0] <--> accessChannel <--> host[1].ethg[0];
         
}
