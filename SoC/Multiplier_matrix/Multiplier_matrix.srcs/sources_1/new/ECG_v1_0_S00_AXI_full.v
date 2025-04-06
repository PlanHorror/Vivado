
`timescale 1 ns / 1 ps

	module ECG_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of ID for for write address, write data, read address and read data
		parameter integer C_S_AXI_ID_WIDTH	= 1,
		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 256,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 40,
		// Width of optional user defined signal in write address channel
		parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
		// Width of optional user defined signal in read address channel
		parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
		// Width of optional user defined signal in write data channel
		parameter integer C_S_AXI_WUSER_WIDTH	= 0,
		// Width of optional user defined signal in read data channel
		parameter integer C_S_AXI_RUSER_WIDTH	= 0,
		// Width of optional user defined signal in write response channel
		parameter integer C_S_AXI_BUSER_WIDTH	= 0
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write Address ID
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_AWID,
		// Write address
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_AWLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_AWSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_AWBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_AWLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_AWCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Quality of Service, QoS identifier sent for each
    // write transaction.
		input wire [3 : 0] S_AXI_AWQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_AWREGION,
		// Optional User-defined signal in the write address channel.
		input wire [C_S_AXI_AWUSER_WIDTH-1 : 0] S_AXI_AWUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid write address and
    // control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_AWREADY,
		// Write Data
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte
    // lanes hold valid data. There is one write strobe
    // bit for each eight bits of the write data bus.
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write last. This signal indicates the last transfer
    // in a write burst.
		input wire  S_AXI_WLAST,
		// Optional User-defined signal in the write data channel.
		input wire [C_S_AXI_WUSER_WIDTH-1 : 0] S_AXI_WUSER,
		// Write valid. This signal indicates that valid write
    // data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    // can accept the write data.
		output wire  S_AXI_WREADY,
		// Response ID tag. This signal is the ID tag of the
    // write response.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_BID,
		// Write response. This signal indicates the status
    // of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Optional User-defined signal in the write response channel.
		output wire [C_S_AXI_BUSER_WIDTH-1 : 0] S_AXI_BUSER,
		// Write response valid. This signal indicates that the
    // channel is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    // can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address ID. This signal is the identification
    // tag for the read address group of signals.
		input wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_ARID,
		// Read address. This signal indicates the initial
    // address of a read burst transaction.
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Burst length. The burst length gives the exact number of transfers in a burst
		input wire [7 : 0] S_AXI_ARLEN,
		// Burst size. This signal indicates the size of each transfer in the burst
		input wire [2 : 0] S_AXI_ARSIZE,
		// Burst type. The burst type and the size information, 
    // determine how the address for each transfer within the burst is calculated.
		input wire [1 : 0] S_AXI_ARBURST,
		// Lock type. Provides additional information about the
    // atomic characteristics of the transfer.
		input wire  S_AXI_ARLOCK,
		// Memory type. This signal indicates how transactions
    // are required to progress through a system.
		input wire [3 : 0] S_AXI_ARCACHE,
		// Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Quality of Service, QoS identifier sent for each
    // read transaction.
		input wire [3 : 0] S_AXI_ARQOS,
		// Region identifier. Permits a single physical interface
    // on a slave to be used for multiple logical interfaces.
		input wire [3 : 0] S_AXI_ARREGION,
		// Optional User-defined signal in the read address channel.
		input wire [C_S_AXI_ARUSER_WIDTH-1 : 0] S_AXI_ARUSER,
		// Write address valid. This signal indicates that
    // the channel is signaling valid read address and
    // control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that
    // the slave is ready to accept an address and associated
    // control signals.
		output wire  S_AXI_ARREADY,
		// Read ID tag. This signal is the identification tag
    // for the read data group of signals generated by the slave.
		output wire [C_S_AXI_ID_WIDTH-1 : 0] S_AXI_RID,
		// Read Data
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of
    // the read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read last. This signal indicates the last transfer
    // in a read burst.
		output wire  S_AXI_RLAST,
		// Optional User-defined signal in the read address channel.
		output wire [C_S_AXI_RUSER_WIDTH-1 : 0] S_AXI_RUSER,
		// Read valid. This signal indicates that the channel
    // is signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    // accept the read data and response information.
		input wire  S_AXI_RREADY,
		
		       
        output wire write_bram_signal       ,
        output wire [19:0] addr_bram_a      ,   
        output wire [15:0] in_bram          ,      
        input  wire [15:0] douta            ,                   
        output wire [19:0] addr_bram_b      ,                   
        input wire [15:0]  doutb            
		
	);

	// AXI4FULL signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg [C_S_AXI_BUSER_WIDTH-1 : 0] 	axi_buser;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rlast;
	reg [C_S_AXI_RUSER_WIDTH-1 : 0] 	axi_ruser;
	reg  	axi_rvalid;
	// aw_wrap_en determines wrap boundary and enables wrapping
	wire aw_wrap_en;
	// ar_wrap_en determines wrap boundary and enables wrapping
	wire ar_wrap_en;
	// aw_wrap_size is the size of the write transfer, the
	// write address wraps to a lower address if upper address
	// limit is reached
	wire [31:0]  aw_wrap_size ; 
	// ar_wrap_size is the size of the read transfer, the
	// read address wraps to a lower address if upper address
	// limit is reached
	wire [31:0]  ar_wrap_size ; 
	// The axi_awv_awr_flag flag marks the presence of write address valid
	reg axi_awv_awr_flag;
	//The axi_arv_arr_flag flag marks the presence of read address valid
	reg axi_arv_arr_flag; 
	// The axi_awlen_cntr internal write address counter to keep track of beats in a burst transaction
	reg [7:0] axi_awlen_cntr;
	//The axi_arlen_cntr internal read address counter to keep track of beats in a burst transaction
	reg [7:0] axi_arlen_cntr;
	reg [1:0] axi_arburst;
	reg [1:0] axi_awburst;
	reg [7:0] axi_arlen;
	reg [7:0] axi_awlen;
	//local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	//ADDR_LSB is used for addressing 32/64 bit registers/memories
	//ADDR_LSB = 2 for 32 bits (n downto 2) 
	//ADDR_LSB = 3 for 42 bits (n downto 3)

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32)+ 1;
	localparam integer OPT_MEM_ADDR_BITS = 3;
	localparam integer USER_NUM_MEM = 1;
	//----------------------------------------------
	//-- Signals for user logic memory space example
	//------------------------------------------------
	wire [OPT_MEM_ADDR_BITS:0] mem_address;
	wire [USER_NUM_MEM-1:0] mem_select;
	reg [C_S_AXI_DATA_WIDTH-1:0] mem_data_out[0 : USER_NUM_MEM-1];

	genvar i;
	genvar j;
	genvar mem_byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BUSER	= axi_buser;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RLAST	= axi_rlast;
	assign S_AXI_RUSER	= axi_ruser;
	assign S_AXI_RVALID	= axi_rvalid;
	assign S_AXI_BID = S_AXI_AWID;
	assign S_AXI_RID = S_AXI_ARID;
	assign  aw_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_awlen)); 
	assign  ar_wrap_size = (C_S_AXI_DATA_WIDTH/8 * (axi_arlen)); 
	assign  aw_wrap_en = ((axi_awaddr & aw_wrap_size) == aw_wrap_size)? 1'b1: 1'b0;
	assign  ar_wrap_en = ((axi_araddr & ar_wrap_size) == ar_wrap_size)? 1'b1: 1'b0;

	// Implement axi_awready generation

	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	      axi_awv_awr_flag <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          // slave is ready to accept an address and
	          // associated control signals
	          axi_awready <= 1'b1;
	          axi_awv_awr_flag  <= 1'b1; 
	          // used for generation of bresp() and bvalid
	        end
	      else if (S_AXI_WLAST && axi_wready)          
	      // preparing to accept next address after current write burst tx completion
	        begin
	          axi_awv_awr_flag  <= 1'b0;
	        end
	      else        
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       
	// Implement axi_awaddr latching

	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	      axi_awlen_cntr <= 0;
	      axi_awburst <= 0;
	      axi_awlen <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag)
	        begin
	          // address latching 
	          axi_awaddr <= S_AXI_AWADDR[C_S_AXI_ADDR_WIDTH - 1:0];  
	           axi_awburst <= S_AXI_AWBURST; 
	           axi_awlen <= S_AXI_AWLEN;     
	          // start address of transfer
	          axi_awlen_cntr <= 0;
	        end   
	      else if((axi_awlen_cntr <= axi_awlen) && axi_wready && S_AXI_WVALID)        
	        begin

	          axi_awlen_cntr <= axi_awlen_cntr + 1;

	          case (axi_awburst)
	            2'b00: // fixed burst
	            // The write address for all the beats in the transaction are fixed
	              begin
	                axi_awaddr <= axi_awaddr;          
	                //for awsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The write address for all the beats in the transaction are increments by awsize
	              begin
	                axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //awaddr aligned to 4 byte boundary
	                axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The write address wraps when the address reaches wrap boundary 
	              if (aw_wrap_en)
	                begin
	                  axi_awaddr <= (axi_awaddr - aw_wrap_size); 
	                end
	              else 
	                begin
	                  axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                  axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}}; 
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_awaddr <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //for awsize = 4 bytes (010)
	              end
	          endcase              
	        end
	    end 
	end       
	// Implement axi_wready generation

	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if ( ~axi_wready && S_AXI_WVALID && axi_awv_awr_flag)
	        begin
	          // slave can accept the write data
	          axi_wready <= 1'b1;
	        end
	      //else if (~axi_awv_awr_flag)
	      else if (S_AXI_WLAST && axi_wready)
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       
	// Implement write response logic generation

	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid <= 0;
	      axi_bresp <= 2'b0;
	      axi_buser <= 0;
	    end 
	  else
	    begin    
	      if (axi_awv_awr_flag && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST )
	        begin
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; 
	          // 'OKAY' response 
	        end                   
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	          //check if bready is asserted while bvalid is high) 
	          //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	 end   
	// Implement axi_arready generation

	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_arv_arr_flag <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          axi_arready <= 1'b1;
	          axi_arv_arr_flag <= 1'b1;
	        end
	      else if (axi_rvalid && S_AXI_RREADY && axi_arlen_cntr == axi_arlen)
	      // preparing to accept next address after current read completion
	        begin
	          axi_arv_arr_flag  <= 1'b0;
	        end
	      else        
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       
	// Implement axi_araddr latching

	//This process is used to latch the address when both 
	//S_AXI_ARVALID and S_AXI_RVALID are valid. 
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_araddr <= 0;
	      axi_arlen_cntr <= 0;
	      axi_arburst <= 0;
	      axi_arlen <= 0;
	      axi_rlast <= 1'b0;
	      axi_ruser <= 0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_arv_arr_flag)
	        begin
	          // address latching 
	          axi_araddr <= S_AXI_ARADDR[C_S_AXI_ADDR_WIDTH - 1:0]; 
	          axi_arburst <= S_AXI_ARBURST; 
	          axi_arlen <= S_AXI_ARLEN;     
	          // start address of transfer
	          axi_arlen_cntr <= 0;
	          axi_rlast <= 1'b0;
	        end   
	      else if((axi_arlen_cntr <= axi_arlen) && axi_rvalid && S_AXI_RREADY)        
	        begin
	         
	          axi_arlen_cntr <= axi_arlen_cntr + 1;
	          axi_rlast <= 1'b0;
	        
	          case (axi_arburst)
	            2'b00: // fixed burst
	             // The read address for all the beats in the transaction are fixed
	              begin
	                axi_araddr       <= axi_araddr;        
	                //for arsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The read address for all the beats in the transaction are increments by awsize
	              begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The read address wraps when the address reaches wrap boundary 
	              if (ar_wrap_en) 
	                begin
	                  axi_araddr <= (axi_araddr - ar_wrap_size); 
	                end
	              else 
	                begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_araddr <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB]+1;
	                //for arsize = 4 bytes (010)
	              end
	          endcase              
	        end
	      else if((axi_arlen_cntr == axi_arlen) && ~axi_rlast && axi_arv_arr_flag )   
	        begin
	          axi_rlast <= 1'b1;
	        end          
	      else if (S_AXI_RREADY)   
	        begin
	          axi_rlast <= 1'b0;
	        end          
	    end 
	end       
	// Implement axi_arvalid generation

	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arv_arr_flag && ~axi_rvalid)
	        begin
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; 
	          // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          axi_rvalid <= 1'b0;
	        end            
	    end
	end    
	// ------------------------------------------
	// -- Example code to access user logic memory region
	// ------------------------------------------

    localparam DATA_MEM_BASE_PHYS = 40'h04_8000_0000;
    localparam KERNEL_MEM_BASE_PHYS = 40'h04_8800_0000;
    localparam OUTPUT_BASE_PHYS = 40'h04_8800_4000;
	reg FF_writerequest,FF_readrequest;
	wire FF_waitrequest;
	
	reg [31:0] in_data;
	reg [31:0] in_kernel;
//	reg [15:0] in_q [0:7];
    
	wire [15:0] out_q;
	
	reg [6:0]  data_ptr   ;
	reg [19:0] kernel_ptr ;
	
//	reg [19:0] kernel_ptr_0;
//	reg [19:0] kernel_ptr_1;
//	reg [19:0] kernel_ptr_2;
//	reg [19:0] kernel_ptr_3;
//	reg [19:0] kernel_ptr_4;
//	reg [19:0] kernel_ptr_5;
//	reg [19:0] kernel_ptr_6;
//	reg [19:0] kernel_ptr_7;
	
	reg [15:0] data_mem[0:103];
	//Data Pin 0
	wire [6:0] signal_r_address0;
	wire   signal_r_ce0;
	wire [15:0] data_in_0;
	
	//Data Pin 1
	wire [6:0] signal_r_address1;
	wire   signal_r_ce1;
	wire [15:0] data_in_1;

	// Kernel Pin 0
	wire [19:0] kernel_address0;
	wire kernel_ce0;
    wire [15:0] kernel_in_0;
    // Kernel Pin 1
	wire [19:0] kernel_address1;
	wire kernel_ce1;
	wire [15:0] kernel_in_1;

	

	
	reg [15:0] dina_r ;
//	wire[19:0] addr_bram_a;
//	wire[19:0] addr_bram_b;
//	reg [15:0] kernel_mem[0: 567777];
//	reg [15:0] kernel_mem_0[70973 - 1 : 0];
//	reg [15:0] kernel_mem_1[70973 - 1 : 0];
//	reg [15:0] kernel_mem_2[70973 - 1 : 0];
//	reg [15:0] kernel_mem_3[70973 - 1 : 0];
//	reg [15:0] kernel_mem_4[70973 - 1 : 0];
//	reg [15:0] kernel_mem_5[70973 - 1 : 0];
//	reg [15:0] kernel_mem_6[70973 - 1 : 0];
//	reg [15:0] kernel_mem_7[70973 - 1 : 0];


	wire [15:0] OutDense3_d0;

    wire [15:0] in_kernel_0;
    wire [15:0] in_kernel_1;
//    wire [15:0] douta;
//    wire [15:0] doutb;
	//////////////////////////////////////////////////
	reg signal_write_data;
	reg done_load_data ;
	always @(posedge S_AXI_ACLK) begin 
	   if (~S_AXI_ARESETN) begin 
	       signal_write_data <= 0;
	   end 
	   else begin 
	      if (axi_awready && S_AXI_AWVALID && (axi_awaddr == DATA_MEM_BASE_PHYS)) begin 
	           signal_write_data <= 1'b1;
	      end 
	      else if (done_load_data) begin 
	           signal_write_data <= 1'b0;
	      end 
	   end
	end
	
	always @(posedge S_AXI_ACLK) begin 
	   if (~S_AXI_ARESETN) begin 
	       data_ptr <= 7'b0;
	       done_load_data <= 1'b0;
	   end 
	   else begin 
	       if (axi_wready && S_AXI_WVALID && (data_ptr < 104) && signal_write_data) begin 
	           data_mem[0+data_ptr] <= S_AXI_WDATA[15 + (32 * 0) : 32*0];
	           data_mem[1+data_ptr] <= S_AXI_WDATA[15 + (32 * 1) : 32*1];
	           data_mem[2+data_ptr] <= S_AXI_WDATA[15 + (32 * 2) : 32*2];
	           data_mem[3+data_ptr] <= S_AXI_WDATA[15 + (32 * 3) : 32*3];
	           data_mem[4+data_ptr] <= S_AXI_WDATA[15 + (32 * 4) : 32*4];
	           data_mem[5+data_ptr] <= S_AXI_WDATA[15 + (32 * 5) : 32*5];
	           data_mem[6+data_ptr] <= S_AXI_WDATA[15 + (32 * 6) : 32*6];
	           data_mem[7+data_ptr] <= S_AXI_WDATA[15 + (32 * 7) : 32*7];
	           data_ptr <= data_ptr + 8;
	       end
	       else if (data_ptr == 104) begin 
	           done_load_data <= 1'b1;
	           data_ptr <= 0;
	       end
	       else begin 
	           done_load_data <= 1'b0;
	       end 
	   end
	end 
	///////////////////////////////////////// 
	reg signal_write_kernel;
	reg done_load_kernel;
	always @(posedge S_AXI_ACLK) begin 
	   if (~S_AXI_ARESETN) begin 
	       signal_write_kernel <= 0;
	   end 
	   else begin 
	      if (axi_awready && S_AXI_AWVALID && (axi_awaddr == KERNEL_MEM_BASE_PHYS)) begin 
	           signal_write_kernel <= 1'b1;
	      end 
	      else if (done_load_kernel) begin 
	           signal_write_kernel <= 1'b0;
	      end 
	   end
	end

	
//	always @(posedge S_AXI_ACLK) begin 
//	   if (~S_AXI_ARESETN) begin 
//	       kernel_ptr <= 19'b0;
	       
//	       done_load_kernel <= 1'b0;
//	   end 
//	   else begin 
//	       if (axi_wready && S_AXI_WVALID && (kernel_ptr < 567784) && signal_write_kernel) begin 
//	           if ((0 <= kernel_ptr) && (kernel_ptr < 70973)) begin 
//	               kernel_mem_0[kernel_ptr_0] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_0 <= kernel_ptr_0 + 1;
//	           end 
//	           else if ((70973 <= kernel_ptr) && (kernel_ptr < 70973*2)) begin
//	               kernel_mem_1[kernel_ptr_1] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_1 <= kernel_ptr_1 + 1; 
//               end 
//               else if ((70973 * 2 <= kernel_ptr) && (kernel_ptr < 70973*3)) begin
//	               kernel_mem_2[kernel_ptr_2] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_2 <= kernel_ptr_2 + 1;
//               end 
//	           else if ((70973 * 3<= kernel_ptr) && (kernel_ptr < 70973*4)) begin
//	               kernel_mem_3[kernel_ptr_3] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_3 <= kernel_ptr_3 + 1; 
//               end 
//               else if ((70973 * 4 <= kernel_ptr) && (kernel_ptr < 70973*5)) begin
//	               kernel_mem_4[kernel_ptr_4] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_4 <= kernel_ptr_4 + 1;
//               end     
//               else if ((70973 * 5 <= kernel_ptr) && (kernel_ptr < 70973*6)) begin
//	               kernel_mem_5[kernel_ptr_5] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_5 <= kernel_ptr_5 + 1;
//               end           
//               else if ((70973 * 6 <= kernel_ptr) && (kernel_ptr < 70973*7)) begin
//	               kernel_mem_6[kernel_ptr_6] <= S_AXI_WDATA[15 + (32 * 0) : 32*0]; 
//	               kernel_ptr_6 <= kernel_ptr_6 + 1;
//               end   
//               kernel_ptr <= kernel_ptr + 1;
//	       end
//	       else if (kernel_ptr == 567784) begin 
//	           done_load_kernel <= 1'b1;
//	           kernel_ptr <= 0;
//	           kernel_ptr_0 <= 0;
//               kernel_ptr_1 <= 0;
//               kernel_ptr_2 <= 0;
//               kernel_ptr_3 <= 0;
//               kernel_ptr_4 <= 0;
//               kernel_ptr_5 <= 0;
//               kernel_ptr_6 <= 0;
//               kernel_ptr_7 <= 0;
//	       end
//	       else begin 
//	           done_load_kernel <= 1'b0;
//	       end 
//	   end
//	end 
//    (* ram_style = "block"  *)reg [15:0] kernel_mem[0: 567777];
//	always @(posedge S_AXI_ACLK) begin 
//	   if (~S_AXI_ARESETN) begin 
//	       kernel_ptr <= 19'b0;
	       
//	       done_load_kernel <= 1'b0;
//	   end 
//	   else begin 
//	       if (axi_wready && S_AXI_WVALID && (kernel_ptr < 567778) && signal_write_kernel) begin 
//	           kernel_mem[kernel_ptr] <= S_AXI_WDATA[15 : 0];
//               kernel_ptr <= kernel_ptr + 1;
//	       end
//	       else if (kernel_ptr == 567778) begin 
//	           done_load_kernel <= 1'b1;
//	           kernel_ptr <= 0;
//	       end
//	       else begin 
//	           done_load_kernel <= 1'b0;
//	       end 
//	   end
//	end 
    reg ena_r;
    reg wea_r;
	always @(posedge S_AXI_ACLK) begin 
	   if (~S_AXI_ARESETN) begin 
	       kernel_ptr <= 20'b0;
	       wea_r      <= 1'b0;
	       done_load_kernel <= 1'b0;
	   end 
	   else begin 
	       if (axi_wready && S_AXI_WVALID && (kernel_ptr < 567777) && signal_write_kernel) begin 
               kernel_ptr <= kernel_ptr + 1;
               dina_r     <= S_AXI_WDATA[15 : 0];
               wea_r      <= 1'b1;
	       end
	       else if (kernel_ptr == 567777) begin 
	           done_load_kernel <= 1'b1;
	           kernel_ptr <= 0;
	           wea_r    <= 1'b0;
	       end
	       else begin 
	           done_load_kernel <= 1'b0;
	       end 
	   end
	end 
	
//	wire [15:0]in_bram ;
	assign in_bram = S_AXI_WDATA[15 : 0];
//	wire write_bram_signal;
	assign write_bram_signal = (signal_write_kernel && ~done_load_kernel) ? signal_write_kernel :1'b0;
//    reg [15:0] dina_r_tmp;
    
//    always @(posedge S_AXI_ACLK) begin 
//        dina_r_tmp <= dina_r;
//    end 

//	assign addr_bram_a        = (signal_write_kernel) ? kernel_ptr : 
//	                            (kernel_ce0) ? kernel_address0 : 20'b0;
	assign addr_bram_a        = (signal_write_kernel) ? kernel_ptr : kernel_address0;                           
//    assign addr_bram_b        = (kernel_ce1) ? kernel_address1 : 20'b0;
	assign addr_bram_b        = kernel_address1;
//	blk_mem_gen_0 kernel_bram(
//    .clka   (S_AXI_ACLK         )           ,
//    .wea    (write_bram_signal  )           ,
//    .addra  (addr_bram_a        )           ,
//    .dina   (in_bram            )           ,
//    .douta  (douta              )           ,
//    .clkb   (S_AXI_ACLK         )           ,
//    .web    (1'b0               )           ,
//    .addrb  (addr_bram_b        )           ,
//    .dinb   ()                              ,
//    .doutb  (doutb              )                 
//	);
	
	assign kernel_in_0 = douta;
	assign kernel_in_1 = doutb;
	
    ////////////////////////////////
    reg start_rg;
    reg done_rg;
    wire OutDense3_ap_vld;
    always @(posedge S_AXI_ACLK) begin 
        if (~S_AXI_ARESETN) begin 
            start_rg   <= 1'b0;
        end 
        else begin 
            if (done_load_data) begin 
                start_rg <= 1'b1;
            end 
            else if (OutDense3_ap_vld) begin 
                start_rg <= 1'b0;
            end  
        end
    end 
   
//   reg [15:0] tmp_data_signal_0;
//   reg [15:0] tmp_data_signal_1;
   reg [15:0] tmp_address_signal_0;
   reg [15:0] tmp_address_signal_1;
    always @(posedge S_AXI_ACLK) begin 
        tmp_address_signal_0 <= signal_r_address0;
        tmp_address_signal_1 <= signal_r_address1;
    end 
    assign data_in_0 = data_mem[tmp_address_signal_0];
    assign data_in_1 = data_mem[tmp_address_signal_1];
    
//    always @(posedge S_AXI_ACLK) begin 
//        if (~S_AXI_ARESETN) begin 
//            data_in_0 <= 0;
//            data_in_1 <= 0;
//        end 
//        else begin 
//            if (signal_r_ce0) begin 
//                data_in_0 <= data_mem[signal_r_address0];
//            end
//            else begin 
//                data_in_0 <= data_in_0;
//            end
//            if (signal_r_ce1)begin 
//                data_in_1 <= data_mem[signal_r_address1];
//            end 
//            else begin 
//                data_in_1 <= data_in_1;
//            end  
//        end 
//    end 

//    always @(posedge S_AXI_ACLK) begin 
//        data_in_0 <= tmp_data_signal_0;
//        data_in_1 <= tmp_data_signal_1;
//    end 

        //reg select ram
   
//    always @(posedge S_AXI_ACLK) begin 
//        if (~S_AXI_ARESETN) begin 
//            kernel_in_0 <= 0;
//            kernel_in_1 <= 0;
//        end 
//        else begin 
//            if (kernel_ce0) begin 
//                kernel_in_0 <= douta;
//            end
//            else begin 
//                kernel_in_0 <= kernel_in_0;
//            end 
//            if (kernel_ce1) begin 
//                kernel_in_1 <= doutb;  
//            end 
//            else begin 
//                kernel_in_1 <= kernel_in_1; 
//            end 
//        end 
//    end 


    reg [15:0] data_out;
    always @(posedge S_AXI_ACLK) begin 
        if (~S_AXI_ARESETN) begin 
            done_rg <= 1'b0;
            data_out <= 0;
        end 
        else begin 
            if (OutDense3_ap_vld) begin 
                done_rg <= OutDense3_ap_vld;
                data_out <= OutDense3_d0;
            end 
            else if (start_rg) begin 
                done_rg <= 1'b0;
            end 
        end 
    end

    localparam OUT_BASE_PHYS = 40'h0;

    reg output_signal;
    reg rg_done_read;
    always @(posedge S_AXI_ACLK) begin 
        if (~S_AXI_ARESETN) begin 
            output_signal <= 256'b0;
        end 
        else begin 
            if (axi_arready && S_AXI_ARVALID && (axi_araddr == OUT_BASE_PHYS)) begin 
                output_signal <= 1'b1;
            end 
            else if (rg_done_read) begin 
                output_signal <= 1'b0;
            end 
            else begin 
                output_signal <= output_signal;
            end 
        end 
    end 


    always @(posedge S_AXI_ACLK) begin 
        if (~S_AXI_ARESETN) begin 
            axi_rdata <= 256'b0;
            rg_done_read    <= 1'b0;
        end 
        else begin 
            if (axi_rvalid && S_AXI_RREADY && output_signal) begin 
                axi_rdata <= {239'b0,done_rg,data_out};
                rg_done_read <= 1'b1;
            end 
            else begin 
                rg_done_read <= 1'b0;
                axi_rdata   <= 0;
            end 
            
        end 
    end 
    
	// Add user logic here
    ECG_CNN CNN(
        .ap_clk(S_AXI_ACLK),
        .ap_rst(~S_AXI_ARESETN),
        .ap_start(start_rg),
        .ap_done(done_w),
        .ap_idle(idle),
        .ap_ready(ready),
        .signal_r_address0(signal_r_address0),
        .signal_r_ce0(signal_r_ce0),
        .signal_r_q0(data_in_0),
        .signal_r_address1(signal_r_address1),
        .signal_r_ce1(signal_r_ce1),
        .signal_r_q1(data_in_1),
        .OutDense3(OutDense3_d0),
        .OutDense3_ap_vld(OutDense3_ap_vld),
        .kernel_address0(kernel_address0),
        .kernel_ce0(kernel_ce0),
        .kernel_q0(kernel_in_0),
        .kernel_address1(kernel_address1),
        .kernel_ce1(kernel_ce1),
        .kernel_q1(kernel_in_1)
    );
	// User logic ends

endmodule