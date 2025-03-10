import socket 
from Core.Support import Font
from time import sleep

class Port:
    
    @staticmethod
    def Get_Port(Server,report,port,Open_Ports):
        print(Font.Color.GREEN + "\n[+]" + Font.Color.WHITE + "CHECKING PORT:{}".format(port))
        host = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        host.settimeout(2)
        Result = host.connect_ex((Server,port))
        if Result == 0:
            print(Font.Color.YELLOW + "[v]" + Font.Color.WHITE + "THIS PORT IS: " + Font.Color.GREEN + "OPEN")
            Open_Ports.append(port)
            f = open(report,"a")
            f.write("Port: {}\n".format(port))
            f.close()
        else:
            print(Font.Color.RED + "[!]" + Font.Color.WHITE + "THIS PORT IS: " + Font.Color.RED + "CLOSED")
        host.close()

    @staticmethod
    def Scan(username,report):
        Open_Ports = []
        Server = socket.gethostbyname(username)
        print(Font.Color.GREEN + "\n[+]" + Font.Color.WHITE + "CHECKING PORTS OF: {}".format(username))
        print(Font.Color.GREEN + "[+]" + Font.Color.WHITE + "{} IP: {}".format(username,Server))
        nPorts = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT AN OPTION\n(1)SET A FROM/TO PORTS\n(2)SCANNING ALL POSSIBILE PORTS\n(3)SCANNING SPECIFIC PORTS\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
        if nPorts == 1:
            Min = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER TO START WITH\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            while Min == "":
                Min = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER TO START WITH\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            Max2 = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER TO START WITH\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            while Max2 == "":
                Max2 = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER TO START WITH\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            Max = Max2 + 1
            Def = True
        elif nPorts == 2:
            Min = 1
            Max = 1024
            Def = True
        elif nPorts == 3:
            Ports_List = []
            amount = 0
            Def = False
            amount = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE AMOUNTS OF PORTS\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            while amount == "":
                amount = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE AMOUNTS OF PORTS\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
            for i in range(amount):
                port = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
                while port == "":
                     port = int(input(Font.Color.BLUE + "\n[+]" + Font.Color.WHITE + "INSERT THE PORT NUMBER\n\n" + Font.Color.GREEN + "[#MR.HOLMES#]" + Font.Color.WHITE + "-->"))
                Ports_List.append(port)
        try:
            if Def:
                for port in range(Min,Max):
                    Port.Get_Port(Server,report,port,Open_Ports)
            else:
                for port in Ports_List:
                    Port.Get_Port(Server,report,port,Open_Ports)
        except Exception as e:
                print(Font.Color.RED + "[!]" + Font.Color.WHITE + "COULD NOT COMUNICATE WITH HOST")
        if len(Open_Ports):
            print(Font.Color.GREEN + "\n[+]" + Font.Color.WHITE + "PRINTING OPEN PORTS FOR: {}".format(username))
            sleep(4)
            for ports in Open_Ports:
                print(Font.Color.YELLOW + "[v]" + Font.Color.WHITE + "PORT: {}".format(ports))
        else:
            print(Font.Color.RED + "\n[!]" + Font.Color.WHITE + "OPS LOOKS LIKE THERE IS NO OPEN PORTS FOR: {}".format(username))   
