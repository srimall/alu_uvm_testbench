class env extends uvm_env;
    `uvm_component_utils(env);
    
    sequencer  sequencer_h;
    driver driver_h;
    
    
    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction 
    
    function void build_phase(uvm_phase phase);
        sequencer_h = new("sequencer_h", this);
        driver_h = driver::type_id::create("driver_h",this);
    
    endfunction : build_phase
    
    function void connect_phase(uvm_phase phase);
        driver_h.seq_item_port.connect(sequencer_h.seq_item_export);
    
    endfunction: connect_phase
    
endclass : env