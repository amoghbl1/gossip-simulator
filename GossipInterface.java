import java.rmi.*;

public interface GossipInterface extends java.rmi.Remote {
        void hearGossip(byte[] gossipProtobuf) throws RemoteException;
}
