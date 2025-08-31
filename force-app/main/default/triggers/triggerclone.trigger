trigger triggerclone on Lead (after insert) {

    if(sttaicvariablehelp.abc)
    {sttaicvariablehelp.abc = false;
    List<Lead> leadList = new List<Lead>();
leadList = Trigger.new.deepClone();
insert leadList;
    }
}