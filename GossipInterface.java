import java.rmi.Remote;
import java.rmi.RemoteException;

public interface GossipInterface extends java.rmi.Remote {
        void hearGossip(byte[] gossipProtobuf) throws RemoteException;
}
