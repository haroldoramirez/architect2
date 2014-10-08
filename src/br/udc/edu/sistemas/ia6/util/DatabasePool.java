package br.udc.edu.sistemas.ia6.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabasePool {
	
	private static DatabasePool databasePool = null;
	
	private Connection connectionList[];
	private Integer initialConnections;
	private Integer openedConnections;
	private Integer maxConnections;
	private Integer currentConnection;
	private String host;
	private String port;
	private String databaseName;
	private String user;
	private String password;
	private String driver;
	private String url;

	private DatabasePool() throws Exception {
		this.host = "localhost";
		this.port = "5432";
		this.databaseName = "ia6";
		this.user = "postgres";
		this.password = "haroldo";
		this.driver = "org.postgresql.Driver";
		this.url = "jdbc:postgresql://" + this.host + ":" + this.port	+ "/" + this.databaseName;
		this.initialConnections = 2;
		this.maxConnections = 10;
		this.currentConnection = 0;
		this.openedConnections = 0;
		this.initialize();
	}
	
	public static DatabasePool getInstance() throws Exception {
		if (databasePool == null) {
			databasePool = new DatabasePool();
		}
		return databasePool;
	}
	
	private void initialize() throws Exception {
		this.connectionList = new Connection[this.maxConnections];
		for (int i = 0; i < this.initialConnections; i++) {
			this.connect(i);
		}
	}
	
	private void connect(Integer connectionId) throws Exception {
		try{
			Class.forName(this.driver);
			this.connectionList[connectionId] = DriverManager.getConnection(this.url, this.user, this.password);
			this.connectionList[connectionId].setAutoCommit(false);
			this.openedConnections++;
		} catch (ClassNotFoundException e) {
			System.out.println("Erro ao conectar no banco de dados: O driver '" + this.driver + "' não foi encontrado!");
			throw e;
		} catch (SQLException e) {
			System.out.println("Erro ao conectar no banco de dados!");
			throw e;
		}
	}
	
	private boolean isConnected(Integer connectionId) throws Exception {
		return (this.connectionList[connectionId] != null) &&
				(!this.connectionList[connectionId].isClosed());
	}
	
	private void updateCurrentConnection() throws Exception{
		this.currentConnection++;
		if (this.currentConnection == this.maxConnections) {
			this.currentConnection = 0;
		}
		if (this.currentConnection == this.openedConnections) {
			for (int i = this.currentConnection; i < (this.currentConnection + initialConnections); i++){
				this.connect(i);
			}
		}
	}
	
	public Connection getConnection() throws Exception {
		if (!isConnected(this.currentConnection)) {
			this.openedConnections--;
			this.connect(this.currentConnection);
		}
		Connection con = this.connectionList[this.currentConnection];
		this.updateCurrentConnection();
		return con;
	}
	
}
