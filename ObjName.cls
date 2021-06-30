public with sharing class ObjName extends fflib_SObjectSelector implements IObjName {
    public ObjName() {
        super(true, true, true);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
            ObjName.Id,
            ObjName.Name
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Object.sObjectType;
    }

    public List<Object> selectAll() {
        return (List<Object>) Database.query(newQueryFactory().toSOQL());
    }

    public List<Object> selectById(Set<ID> idSet) {
        return (List<Object>) selectSObjectsById(idSet);
    }
}
