/**

 [Background]($DOCURL/examples/produce-exchange#Produce-Exchange-Standards-Specification)
 --------------------
*/

actor server = {

/**
 Server Actor
 =======================================

 The `Server` actor defines an interface for messages sent
 by all participants, and the responses received in return.

 See also:

 - [client-server types]($DOCURL/examples/produce-exchange/serverTypes.md#server-types).
 - the **[server `Model` class]($DOCURL/examples/produce-exchange/serverModel.html)**.


 Registrar-based ingress messages
 ================================================

 The registrar provides functions to add and to remove entities from
 the following (mostly-static) tables:

 - **Static resource information:** truck types, produce types and region information.
 - **Participant information:** producers, retailers and transporters.
 - **Dynamic resource information:** inventory, routes and reservations.

 For each of the entities listed above, we have an add (`Add`)
 and remove (`Rem`) function below, prefixed by `registrar`-, and
 suffixed by one of the entities in the following list:

 - `User`,
 - `TruckType`,
 - `Region`,
 - `Produce`,
 - `Producer`,
 - `Retailer`, or
 - `Transporter`.


 `User`
 =========
 Messages about users.


 `registrarAddUser`
 ----------------------
 Register a new user, who may play several roles in the exchange.

 The given `user_name` must be unique to the exchange; the operation fails otherwise.

 */

  registrarAddUser(
    user_name: Text,
    public_key: Text,
    description: Text,
    region: RegionId,
    isDeveloper: Bool,
    isProducer: Bool,
    isRetailer: Bool,
    isTransporter: Bool
  ) : async ?UserId {
    getModel().addUser(
      user_name,
      public_key,
      description,
      region,
      isDeveloper,
      isProducer,
      isRetailer,
      isTransporter
    )
  };

  /**
   `allUserInfo`
   -------------
   Get info for all users.
   */
  allUserInfo() : async [UserInfo] {
    getModel().userTable.allInfo()
  };

  /**
   `getUserInfo`
   ---------------------------
   Get the information associated with a user, based on its id.
   */
  getUserInfo(id:UserId) : async ?UserInfo {
    getModel()
      .userTable.getInfo(id)
  };

 /**
 `TruckType`
 ==============
 Messages about truck types.
 */


  /**
   `reigstrarAddTruckType`
   ------------------------

   */

  registrarAddTruckType(
    short_name_:  Text,
    description_: Text,
    capacity_ : Weight,
    isFridge_ : Bool,
    isFreezer_ : Bool,
  ) : async ?TruckTypeId {
    getModel()
      .truckTypeTable.addInfoGetId(
        func (id_:TruckTypeId) : TruckTypeInfo =

        // xxx: AS should have more concise syntax for this pattern, below:
        // two problems I see, that are separate:
        // 1: repeating the label/variable name, which is the same in each case, twice.
        // 2: explicit type annotations, because of "type error, cannot infer type of forward variable ..."
        //    but two other sources exist for each type: the type of `insert` is known, and hence, this record has a known type,
        //    and, the type of each of these `variables` is known, as well.

        shared {
          id=id_ :TruckTypeId;
          short_name=short_name_:Text;
          description=description_:Text;
          capacity=capacity_:Weight;
          isFridge=isFridge_:Bool;
          isFreezer=isFreezer_:Bool;
        })
  };

  /**
   `registrarRemTruckType`
   ---------------------
   */

  registrarRemTruckType(
    id: TruckTypeId
  ) : async ?() {
    getModel().truckTypeTable.remGetUnit(id)
  };

  /**
   `getTruckTypeInfo`
   ---------------------
   */

  getTruckTypeInfo(
    id: TruckTypeId
  ) : async ?TruckTypeInfo {
    getModel().truckTypeTable.getInfo(id)
  };

  /**
   `allTruckTypeInfo`
   ---------------------
   */

  allTruckTypeInfo() : async [TruckTypeInfo] {
    getModel().truckTypeTable.allInfo()
  };


  /**
   `Region`
   ==============
   Messages about regions.

   */

  /**
   `registrarAddRegion`
   ---------------------
   adds the region to the system; fails if the given information is
   invalid in any way.
   */

  registrarAddRegion(
    short_name_:  Text,
    description_: Text,
  ) : async ?RegionId {
    getModel().regionTable.addInfoGetId(
      func (id_:RegionId) : RegionInfo =
        shared {
          id = id_:RegionId;
          short_name=short_name_:Text;
          description=description_:Text
        })
  };

  /**
   `registrarRemRegion`
   ---------------------

   returns `?()` on success, and `null` on failure.
   */

  registrarRemRegion(
    id: RegionId
  ) : async ?() {
    getModel().regionTable.remGetUnit(id)
  };

  /**
   `getRegionInfo`
   ---------------------

   See also: [server type `RegionInfo`]($DOCURL/examples/produce-exchange/serverTypes.md#regioninfo).

   */

  getRegionInfo(
    id: RegionId
  ) : async ?RegionInfo {
    getModel().regionTable.getInfo(id)
  };


  /**
   `allRegionInfo`
   ---------------------

   See also: [server type `RegionInfo`]($DOCURL/examples/produce-exchange/serverTypes.md#regioninfo).

   */

  allRegionInfo() : async [RegionInfo] {
    getModel().regionTable.allInfo()
  };


  /**
   `Produce`
   =================
   Messages about produce

   */

  /**
   `registrarAddProduce`
   ---------------------

   adds the produce to the system; fails if the given information is invalid in any way.
   */

  registrarAddProduce(
    short_name_:  Text,
    description_: Text,
    grade_: Grade,
  ) : async ?ProduceId {
    getModel().produceTable.addInfoGetId(
      func (id_:ProduceId) : ProduceInfo =
        shared {
          id = id_:ProduceId;
          short_name=short_name_:Text;
          description=description_:Text;
          grade=grade_:Grade
        })
  };

  /**
   `registrarRemProduce`
   ---------------------

   returns `?()` on success, and `null` on failure.
   */

  registrarRemProduce(
    id: ProduceId
  ) : async ?() {
    getModel().produceTable.remGetUnit(id)
  };


  /**
   `getProduceInfo`
   ---------------------
   */

  getProduceInfo(
    id: ProduceId
  ) : async ?ProduceInfo {
    getModel().produceTable.getInfo(id)
  };

  /**
   `allProduceInfo`
   ---------------------
   */

  allProduceInfo() : async [ProduceInfo] {
    getModel().produceTable.allInfo()
  };

  /**
   `Producer`
   ===============
   Messages about producers.

   */

  /**
   `registrarAddProducer`
   ---------------------

   adds the producer to the system; fails if the given region is non-existent.
   */

  registrarAddProducer(
    short_name_:  Text,
    description_: Text,
    region_: RegionId,
  ) : async ?ProducerId {
    getModel().producerTable.addInfoGetId(
      func(id_:ProducerId):ProducerInfo {
        shared {
          id=id_:ProducerId;
          short_name=short_name_:Text;
          description=description_:Text;
          region=region_:RegionId;
          inventory=[];
          reserved=[];
        }
      })
  };

  /**
   `registrarRemProducer`
   ---------------------

   returns `?()` on success, and `null` on failure.
   */

  registrarRemProducer(
    id: ProducerId
  ) : async ?() {
    getModel().producerTable.remGetUnit(id)
  };


  /**
   `getProduceInfo`
   ---------------------
   */

  getProducerInfo(
    id: ProducerId
  ) : async ?ProducerInfo {
    getModel().producerTable.getInfo(id)
  };

  /**
   `allProducerInfo`
   ---------------------
   */

  allProducerInfo() : async [ProducerInfo] {
    getModel().producerTable.allInfo()
  };



  /**
   `Retailer`
   ============
   Messages to `Add`, `Rem` and `Inspect` retailers.
   */

  /**
   `registrarAddRetailer`
   ---------------------

   adds the producer to the system; fails if the given region is non-existent.
   */

  registrarAddRetailer(
    short_name_:  Text,
    description_: Text,
    region_: RegionId,
  ) : async ?RetailerId {
    getModel().retailerTable.addInfoGetId(
      func(id_:RetailerId):RetailerInfo {
        shared {
          id=id_:RetailerId;
          short_name=short_name_:Text;
          description=description_:Text;
          region=region_:RegionId
        }
      })
  };

  /**
   `registrarRemRetailer`
   ---------------------

   returns `?()` on success, and `null` on failure.
   */

  registrarRemRetailer(
    id: RetailerId
  ) : async ?() {
    getModel().retailerTable.remGetUnit(id)
  };

  /**
   `getRetailerInfo`
   ---------------------
   */

  getRetailerInfo(
    id: RetailerId
  ) : async ?RetailerInfo {
    getModel().retailerTable.getInfo(id)
  };

  /**
   `allRetailerInfo`
   ---------------------
   */

  allRetailerInfo() : async [RetailerInfo] {
    getModel().retailerTable.allInfo()
  };


  /**
   `Transporter`
   ================
   Messages to `Add`, `Rem` and `Inspect` transporters.
   */

  /**
   `registrarAddTransporter`
   ---------------------

   */
  registrarAddTransporter(
    short_name_:  Text,
    description_: Text,
  ) : async ?TransporterId {
    getModel().transporterTable.addInfoGetId(
      func(id_:TransporterId):TransporterInfo {
        shared {
          id=id_:TransporterId;
          short_name=short_name_:Text;
          description=description_:Text;
          routes=[];
          reserved=[];
        }
      })

  };

  /**
   `registrarRemTransporter`
   ---------------------

   */

  registrarRemTransporter(
    id: TransporterId
  ) : async ?() {
    getModel().transporterTable.remGetUnit(id)
  };

  /**
   `getTransporterInfo`
   ---------------------
   */

  getTransporterInfo(
    id: TransporterId
  ) : async ?TransporterInfo {
    getModel().transporterTable.getInfo(id)
  };


  /**
   `allTransporterInfo`
   ---------------------
   */

  allTransporterInfo() : async [TransporterInfo] {
    getModel().transporterTable.allInfo()
  };


  /**
   `Producer`-based ingress messages:
   ==========================================
   */

  /**
   `producerAddInventory`
   ------------------------------------------

   See also [Model.producerAddInventory]($DOCURL/stdlib/examples/produce-exchange/serverModel.md#produceraddinventory)
   */
  producerAddInventory(
    id:   ProducerId,
    prod: ProduceId,
    quant:Quantity,
    weight:Weight,
    ppu:  PricePerUnit,
    begin:Date,
    end:  Date,
    comments: Text,
  ) : async ?InventoryId {
    getModel().
      producerAddInventory(
        null, id, prod, quant, weight, ppu, begin, end, comments)
  };

  /**
   `producerUpdateInventory`
   ------------------------------------------

   */
  producerUpdateInventory(
    iid:  InventoryId,
    id:   ProducerId,
    prod: ProduceId,
    quant:Quantity,
    weight:Weight,
    ppu:  PricePerUnit,
    begin:Date,
    end:  Date,
    comments: Text,
  ) : async ?() {
    getModel().
      producerUpdateInventory(
        iid, id, prod, quant, weight, ppu, begin, end, comments)
  };

  /**
   `producerRemInventory`
   ---------------------------
   */
  producerRemInventory(id:InventoryId) : async ?() {
    getModel()
      .producerRemInventory(id)
  };

  /**
   `producerAllInventoryInfo`
   ---------------------------
   */
  producerAllInventoryInfo(id:ProducerId) : async ?[InventoryInfo] {
    getModel()
      .producerAllInventoryInfo(id)
  };

  /**
   `producerReservations`
   ---------------------------
   */
  producerReservations(id:ProducerId) : async ?[ReservedInventoryInfo] {
    getModel()
      .producerReservations(id)
  };


  /**
   Inventory and produce information
   ======================================
   Messages about produce and inventory

   */

  /**
   `produceMarketInfo`
   ---------------------------
   The last sales price for produce within a given geographic area; null region id means "all areas."
   */
  produceMarketInfo(id:ProduceId, reg:?RegionId) : async ?[ProduceMarketInfo] {
    getModel()
      .produceMarketInfo(id, reg)
  };


  /**
   `allInventoryInfo`
   ---------------------------
   Get the information for all known inventory.
   */
  allInventoryInfo() : async [InventoryInfo] {
    getModel()
      .inventoryTable.allInfo()
  };

  /**
   `getInventoryInfo`
   ---------------------------
   Get the information associated with inventory, based on its id.
   */
  getInventoryInfo(id:InventoryId) : async ?InventoryInfo {
    getModel()
      .inventoryTable.getInfo(id)
  };


  /**
   `Transporter`-based ingress messages:
   ===========================================
   */

  /**
   `transporterAddRoute`
   ---------------------------
   */
  transporterAddRoute(
    trans:  TransporterId,
    rstart: RegionId,
    rend:   RegionId,
    start:  Date,
    end:    Date,
    cost:   Price,
    ttid:   TruckTypeId
  ) : async ?RouteId {
    getModel().transporterAddRoute(trans, rstart, rend, start, end, cost, ttid)
  };

  /**
   `transporterRemRoute`
   ---------------------------
   */
  transporterRemRoute(id:RouteId) : async ?() {
    getModel()
      .transporterRemRoute(id)
  };

  /**
   `transporterAllRouteInfo`
   ---------------------------
   */
  transporterAllRouteInfo(id:TransporterId) : async ?[RouteInfo] {
    getModel()
      .transporterAllRouteInfo(id)
  };

  /**
   `transporterAllReservationInfo`
   ---------------------------
   */
  transporterAllReservationInfo(id:TransporterId) : async ?[ReservedRouteInfo] {
    getModel()
      .transporterAllReservationInfo(id)
  };

  /**
   `allRouteInfo`
   ---------------------------
   Get the information for all known routes.
   */
  allRouteInfo() : async [RouteInfo] {
    getModel()
      .routeTable.allInfo()
  };

  /**
   `Retailer`-based ingress messages:
   ======================================

   `retailerQueryAll`
   ---------------------------

   TODO-Cursors (see above).

   */
  retailerQueryAll(id:RetailerId) : async ?QueryAllResults {
    getModel().
      retailerQueryAll(id)
  };

  /**
   `retailerQueryDates`
   ---------------------------

   Retailer queries available produce by delivery date range; returns
   a list of inventory items that can be delivered to that retailer's
   geography within that date.

   */
  retailerQueryDates(
    id:RetailerId,
    begin:Date,
    end:Date
  ) : async ?[InventoryInfo]
  {
    getModel().
      retailerQueryDates(id, begin, end)
  };

  /**
   `retailerReserve`
   ---------------------------
   */
  retailerReserve(
    id:RetailerId,
    inventory:InventoryId,
    route:RouteId) : async ?(ReservedInventoryId, ReservedRouteId)
  {
    getModel().
      retailerReserve(id, inventory, route)
  };

  /**
   `retailerReservations`
   ---------------------------

   TODO-Cursors (see above).

   */
  retailerReservations(id:RetailerId) :
    async ?[(ReservedInventoryInfo,
             ReservedRouteInfo)]
  {
    getModel().
      retailerAllReservationInfo(id)
  };



  /**

   Developer-based ingress messages:
   ========================================================

   The following messages may originate from developers

   */

  /**
   `getCounts`
   ----------
   */

  getCounts() : async ProduceExchangeCounts {
    let m = getModel();
    shared {
      truck_type_count         = m.truckTypeTable.count();
      region_count             = m.regionTable.count();
      produce_count            = m.produceTable.count();
      inventory_count          = m.inventoryTable.count();
      reserved_inventory_count = m.reservedInventoryTable.count();
      producer_count           = m.producerTable.count();
      retailer_count           = m.retailerTable.count();
      transporter_count        = m.transporterTable.count();
      route_count              = m.routeTable.count();
      reserved_route_count     = m.reservedRouteTable.count();

      retailer_query_count     = m.retailerQueryCount;
      retailer_query_cost      = m.retailerQueryCost;
      retailer_join_count      = m.retailerJoinCount;
    }
  };

  /**
   `devViewGMV`
   -------------

   MVP:

   > Developer can see the GMV, the aggregate sum of how many sales have
been processed
*/

  devViewGMV() : async ?Nat {
    nyi()
  };

  /**
   `devViewQueries`
   ----------------

   MVP:

   > Developer can see how many aggregate queries have been made by all retailers

   */

  devViewQueries() : async ?Nat {
    ?getModel().retailerQueryCount;
  };


  /**
   `devViewReservations`
   ----------------------

   MVP:

   > Developer can see how many aggregate sales orders have been made by all retailers

   */

  devViewReservations() : async Nat {
    getModel().reservedInventoryTable.count()
  };

  /**
   `devViewProducers`
   -------------------

   MVP:

   > Developer can see how many producers in the system and how many goods each has

   See also [`producerInfo`](#producerinfo).

   */

  devViewProducers() : async [ProducerInfo] {
    getModel().producerTable.allInfo()
  };


  /**
   `devViewTransporters`
   -------------------

   MVP:

   > Developer can see how many transporters in the system and how many routes each has

   See also [`transporterInfo`](#transporterinfo).

   */

  devViewTransporters() : async [TransporterInfo] {
    getModel().transporterTable.allInfo()
  };

  /**
   `devViewRetailers`
   -------------------

   MVP:

   > Developer can see how many retailers in the system and how many queries and how many sales orders

   See also [`retailerInfo`](#retailerinfo).

   */

  devViewRetailers() : async [RetailerInfo] {
    getModel().retailerTable.allInfo()
  };


  ///////////////////////////////////////////////////////////////////////////
  // @Omit:

  // See `serverModel.as` for the Model class's implementation

  // Matthew-Says:
  // There are two initialization options for the model field:
  // 1. Call Model() directly; using this option now.
  // 2. Call Model() later, when we try to access the model field.

  private var model : Model = Model(); // OPTION 2: null;

  private getModel() : Model {
    model
    // OPTION 2:
    // switch model {
    //   case (null) {
    //          let m = Model();
    //          model := ?m; m
    //        };
    //   case (?m) m;
    // }
    //
  };

/**
 End of interface definition
-----------------------------------
  With the following closing brace, the interface of the `Server` is thusly defined.
 */
};// end: actor class `Server`