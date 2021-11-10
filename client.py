import socket
import pickle

FORMAT = 'utf-8'

def connect(movie):
    #create a client 
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((socket.gethostname(), 5721))
    print("Connecting to server")
    print("Sending request")
    
    #send request to server
    data = pickle.dumps([movie])
    s.send(data)

    #receive reply from server
    msg = s.recv(1024)
    data = pickle.loads(msg)    #serialize using pickle
    print(data)
    link = data.get('url')
    YTid = link.split("=")
    return YTid[1]

    
