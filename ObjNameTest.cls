@isTest
public class {ObjName}Test {
    
    @TestSetup
    static void setup() {
        fflib_ISObjectUnitOfWork uow = Application.UnitOfWork.newInstance();
        
        uow.registerNew(
            new {Object}(Name = 'Test Data')
        );
        
        uow.commitWork();
    }
    
    @isTest
    static void whenQueryThenGetAllSpecialDeals() {
        System.runAs(TestUtils.standardUser()) {
            List<{Object}> lstData = new {Object}()
                .selectAll();
            
            System.assertEquals(1, lstData.size(), 'Unexpected number of records');
            System.assertEquals('Test Data', lstData[0].Name, 'Unexpected Name');
        }
    }
    
    @isTest
    static void whenQueryByIdThenGetSpecialDeal() {
        List<ID> Ids = new List<ID>();
        for ({Object} objDeal : [SELECT Id FROM {Object}]) {
            Ids.add(objDeal.Id);
        }
        
        System.runAs(TestUtils.standardUser()) {
            List<{Object}> lst = new {Object}()
                .selectById(new Set<ID>(Ids));
            
            System.assertEquals(1, lst.size(), 'Unexpected number of records');
            System.assertEquals('Test Data', lst[0].Name, 'Unexpected Name');
        }
    }
}