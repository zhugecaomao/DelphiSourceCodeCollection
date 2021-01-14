{*******************************************************}
{                                                       }
{       Top Support Delphi Library                      }
{       Storage classes for lists and binary trees      } 
{                                                       }
{       Copyright (c) 1997 - 1999, Top Support          }
{                                                       }
{*******************************************************}

unit TSSetLib;

interface

uses
    Windows, Classes, SysUtils;

    {TtsCustomSet

     TtsCustomSet is an abstract base class that can be used to provide general
     purpose sets for fast storage and retrieval of elements. The elements in a
     set are stored as a binary tree. The type of elements to be stored are
     defined in TtsCustomSet's derived classes. Ready made set classes are
     provided for strings, integers and objects (in TtsStringSet, TtsIntegerSet and
     TtsObjectSet respectively). The base class handles adding, searching and
     deletion of the tree nodes. The derived classes define the Add, Get
     and Remove methods for the handling of their specific datatypes.

     The elements of a set are stored in TtsSetNode objects. TtsSetNode itself
     provides no actual storage location for the elements, but only provides the
     basic handling of the nodes. A set class should define its own nodes
     as a derived class of TtsSetNode and provide for the actual storage.
     See the classes TtsStringSet, TtsIntegerSet and TtsObjectSet for an example.

     TtsSetNode provides a virtual method 'compare' for comparing the elements in
     a set so they can be stored according to their relative order. Subclasses
     should override this method for the specific elements to be stored.

     TtsSetNode:
        Count
            Reference count. The number of times the element has been added to the
            set.
        Left
            Subtree containing the smaller elements in the set.
        Right
            Subtree containing the larger elements in the set.
        Release
            Frees the node. Can be overridden to provide special release
            handling for the data in the node. See TtsObjectSetNode for an example
        Compare
            Compares one node element to another and stores the elements
            accordingly. Must be overridden.
        CompareKey
            Compares the keyvalue of a node element to another keyvalue. In the
            default implementation it simply calls Compare. Can be overridden.
        Value
            Returns a pointer to the value in the node. This method is used
            by TtsCustomSet.List to create a list of pointers to set elements.
            Must be overridden.

     TtsCustomSet:
        Count
            The number of set elements (= the number of nodes)
        NewNode
            Virtual function for creating a new set node. Must be overridden in
            the subclass.
        AddNode
            Adds a new element to the set. If an element with the same compare
            value already exists, the element's node reference count is
            increased.
        GetNode
            Searches for an element in the sets.
        RemoveNode
            Removes the element from the set.
        List
            Returns a TtsSetList, which is a sorted list of the elements in the
            set. The list can be used to iterate through the elements in the
            set.

     TtsSetList:
        Count
            The number of elements in the list
        Items
            An array[1..Count] of items in the list.
     }


    {TtsStringSet, TtsIntegerSet, TtsRealSet and TtsObjectSet

     TtsStringSet, TtsIntegerSet and TtsRealSet provide implementations for sets of
     strings, integers and reals. The interface to the sets is provided by the
     methods Add, Get and Remove. These methods do little more than
     call AddNode, GetNode and RemoveNode in the TtsCustomSet base class.

     TtsObjectSet provides the implementation for a set of objects. It has
     basically the same interface as TtsStringSet and TtsIntegerSet, but provides
     an extra base class, TtsSetElement. Objects which are to be stored in the a
     TtsObjectSet must be derived from this class. When an object is added to the
     set, a reference to the object is stored in a node. If the new object has
     the same compare value as an already existing object, the new object
     replaces the old one and the old one is freed. You can change this behaviour by
     overriding the Release and Copy methods of TtsSetElement.

     TtsStringSet, TtsIntegerSet, TtsRealSet and TtsObjectSet:
        Add
            Adds an element to the set.
        Get
            Searches an element in the set.
        Remove
            Removes an element from the set.

     TtsSetElement (base class for objects in TtsObjectSet):
        Compare
            Compare one object to another. Must be overridden.
            In most cases this method can be simply implemented as a call to
            CompareKey below, passing the keyvalue elements of the object being
            compared as the parameter.
        CompareKey
            Compares the keyvalues of one object to another. Must be overridden.
            The keyvalue of the other object is passed as an array of const.
        Release
            Frees the object. It is called when the node is freed or when the
            node object is replaced by another object (which occurs when a new
            object is added with the same compare value as an already present
            object). It can be overridden to prevent objects from actually being
            freed when they are removed from the set.
        Copy
            When an object is added to a set a reference to that object is
            is stored in its node. If you want to store a copy of the object
            rather than the object itself, you should override the Copy method.
            In its default implementation it simply returns a reference to the
            object that was passed with the add method. You can override it to
            duplicate the object and return a reference to the duplicate.
    }


    {TtsIntegerList

     TtsIntegerList provides an implementation for a dynamic array of integers
     based on the TList class.}



type
    TtsSetOrder = (ordSmaller, ordEqual, ordLarger);

    PtsSetListArray = ^TtsSetListArray;
    TtsSetListArray = array[1..MaxListSize] of Pointer;

    PtsVarRecArray = ^TtsVarRecArray;
    TtsVarRecArray = array[0..MaxListSize] of TVarRec;

    PtsLongintArray = ^TtsLongintArray;
    TtsLongintArray = array[0..MaxListSize] of Longint;

type
    TtsCustomSet = class;

    TtsSetNode = class(TObject)
    protected
        FLeft : TtsSetNode;
        FRight : TtsSetNode;
        FBalance: Shortint;

        procedure Initialize;
        procedure Assign(Source: TtsSetNode); virtual;
        property  Balance: Shortint read FBalance write FBalance;

    public
        constructor CreatePtr(NodeValue : Pointer); virtual;
        destructor  Destroy; override;

        function Release(DestroyingSet : Boolean) : Pointer; virtual;
        function Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; virtual;
        function CompareKey(NodeSet: TtsCustomSet; KeyValue : Pointer) : TtsSetOrder; virtual;
        function Value : Pointer; virtual;

        property Left : TtsSetNode read FLeft write FLeft;
        property Right : TtsSetNode read FRight write FRight;
    end; //class TtsSetNode

    TtsSetList = class(TObject)
    protected
        FCount : Longint;
        FItems : PtsSetListArray;

        procedure Initialize;
        procedure SetItems(Index : Longint; Value : Pointer);
        function  GetItems(Index : Longint) : Pointer;

    public
        constructor CreateCnt(NrOfElements : Longint);
        destructor  Destroy; override;

        property Count : Longint read FCount;
        property Items[Index : Longint] : Pointer read GetItems write SetItems;
    end; //class TtsSetList

    TtsNodeStackElement = record
        Node: TtsSetNode;
        Direction: Shortint;
    end;

    PtsNodeStackArray = ^TtsNodeStackArray;
    TtsNodeStackArray = array[1..MaxListSize] of TtsNodeStackElement;

    TtsNodeStack = class(TObject)
    protected
        FBuffer: PtsNodeStackArray;
        FBufSize: Integer;
        FCount: Integer;

        function  Push(Node: TtsSetNode; Direction: Shortint): Integer;
        function  Pop: TtsNodeStackElement;
        procedure Replace(Index: Integer; Node: TtsSetNode; Direction: Shortint);
        procedure Reset;
        function  GetItem(Index: Integer): TtsNodeStackElement;

        property  Count: Integer read FCount;
        property  Item[Index: Integer]: TtsNodeStackElement read GetItem; default;
    public
        constructor Create;
        destructor  Destroy; override;
    end;

    TtsCustomSet = class(TObject)
    protected
        FCount : Longint;
        FTopNode : TtsSetNode;
        FStack: TtsNodeStack;
        FAssigning: Integer;

        procedure Initialize;
        procedure DestroyNodes(Tree : TtsSetNode);
        procedure PlaceTreeInList(Node : TtsSetNode; SetList : TtsSetList; var ListPos : Longint);
        function  GetNewNode(NodeValue: Pointer): TtsSetNode;
        procedure SearchNode(NodeValue: Pointer; var ParentNode,
                             BalanceNode, NewNode: TtsSetNode; var Found: Boolean);
        procedure InsertSetBalance(NodeValue: Pointer; FromNode, ToNode: TtsSetNode);
        procedure RotateSingle(Direction: Shortint; var SubTopNode: TtsSetNode; BalanceNode, BalanceChildNode: TtsSetNode);
        procedure RotateDouble(Direction: Shortint; var SubTopNode: TtsSetNode; BalanceNode, BalanceChildNode: TtsSetNode);
        procedure InsertRebalance(Direction: Shortint; ParentNode, BalanceNode, BalanceChildNode: TtsSetNode);

        function  AddNode(NodeValue : Pointer) : TtsSetNode;
        function  GetNode(Tree : TtsSetNode; NodeValue : Pointer) : TtsSetNode;
        function  TraceElement(Value: Pointer): TtsSetNode;
        function  NextSmallestElement(Node: TtsSetNode): TtsSetNode;
        procedure DeleteNode(Node: TtsSetNode);
        procedure RotateRebalance(var SubTopNode: TtsSetNode; var Done: Boolean);
        procedure RemoveRebalance;
        procedure ReplaceNode(ParentNode, Node, RplNode: TtsSetNode; StackPos: Integer);
        function  RemoveNode(Value: Pointer): TtsSetNode;
        function  NewNode(NodeValue : Pointer) : TtsSetNode; virtual;
        function  CopyNodes(Node: TtsSetNode): TtsSetNode; virtual;
        function  GetAssigning: Boolean;

        property  Stack: TtsNodeStack read FStack;

    public
        constructor Create; virtual;
        destructor  Destroy; override;

        procedure Assign(Source: TtsCustomSet); virtual;
        procedure Clear; virtual;
        function  List : TtsSetList;
        function  TreeHeight(Node: TtsSetNode): Integer;
        function  IsBalanced(Node: TtsSetNode): Boolean;
        function  CheckBalance: Boolean;
        function  CheckHeight: Integer;

        property Assigning: Boolean read GetAssigning;
        property Count : Longint read FCount;
        property TopNode: TtsSetNode read FTopNode;
    end; //class TtsCustomSet


    TtsStringSetNode = class(TtsSetNode)
    protected
        FNodeValue : string;

        procedure Assign(Source: TtsSetNode); override;
    public
        constructor Create(NodeValue : string);

        function Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
        function Value : Pointer; override;
    end; //class TtsStringSetNode

    TtsStringSet = class(TtsCustomSet)
    protected
        function NewNode(NodeValue : Pointer) : TtsSetNode; override;

    public
        function Add(NodeValue : string) : Pointer; virtual;
        function Get(NodeValue : string) : Pointer; virtual;
        function Remove(NodeValue : string) : Pointer; virtual;
    end; //class TtsStringSet

    TtsVariantSetNode = class(TtsSetNode)
    protected
        FNodeValue : Variant;
    public
        constructor Create(NodeValue : Variant);

        function Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
        function Value : Pointer; override;
    end; //class TtsVariantSetNode

    TtsVariantSet = class(TtsCustomSet)
    protected
        function NewNode(NodeValue : Pointer) : TtsSetNode; override;

    public
        function Add(NodeValue : Variant) : Pointer; virtual;
        function Get(NodeValue : Variant) : Pointer; virtual;
        function Remove(NodeValue : Variant) : Pointer; virtual;
    end; //class TtsVariantSet

    TtsIntegerSetNode = class(TtsSetNode)
    protected
        FNodeValue : Longint;
    public
        constructor Create(NodeValue : Longint);

        function  Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
        function  Value : Pointer; override;
    end; //class TtsIntegerSetNode

    TtsIntegerSet = class(TtsCustomSet)
    protected
        function NewNode(NodeValue : Pointer) : TtsSetNode; override;

    public
        function Add(NodeValue : Longint) : Pointer; virtual;
        function Get(NodeValue : Longint) : Pointer; virtual;
        function Remove(NodeValue : Longint) : Pointer; virtual;
    end; //class TtsIntegerSet

    TtsRealSetNode = class(TtsSetNode)
    protected
        FNodeValue : Double;
    public
        constructor Create(NodeValue : Double);

        function Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
        function Value : Pointer; override;
    end; //class TtsRealSetNode

    TtsRealSet = class(TtsCustomSet)
    protected
        function NewNode(NodeValue : Pointer) : TtsSetNode; override;

    public
        function Add(NodeValue : Double) : Pointer; virtual;
        function Get(NodeValue : Double) : Pointer; virtual;
        function Remove(NodeValue : Double) : Pointer; virtual;
    end; //class TtsRealSet

    TtsSetElement = class(TObject)
    public
        function Release(DestroyingSet : Boolean) : TtsSetElement; virtual;
        function Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder; virtual;
        function CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder; virtual;
        function Copy: TtsSetElement;
        function AssignCopy: TtsSetElement;
        function StringValue : string; virtual;
    end;

    TtsObjectSetNode = class(TtsSetNode)
    protected
        FNodeValue : TtsSetElement;
    public
        constructor Create(NodeValue : TtsSetElement);

        function  CompareKey(NodeSet: TtsCustomSet; KeyValue : Pointer) : TtsSetOrder; override;
        function  Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder; override;
        function  Release(DestroyingSet : Boolean) : Pointer; override;
        function  Value : Pointer; override;

        property NodeValue: TtsSetElement read FNodeValue;
    end;

    TtsObjectSet = class(TtsCustomSet)
    protected
        function NewNode(NodeValue : Pointer) : TtsSetNode; override;

    public
        function Add(NodeValue : TtsSetElement) : Pointer; virtual;
        function Get(KeyValue : array of const) : Pointer; virtual;
        function Remove(KeyValue : array of const) : Pointer; virtual;
    end;


    TtsIntegerList = class(TList)
    public
        procedure AddItem(Item: Integer);

        function  GetItem(Index: Integer): Integer;
        procedure SetItem(Index: Integer; Value: Integer);
        function  Remove(Value: Integer): Integer;

        property Item[Index : Integer] : Integer read GetItem write SetItem; default;
    end; //TtsIntegerList

    {TtsSortIntList}
    {Sorted list of Longints. Index ranges from 1 to Count}

    TtsSortIntList = class(TObject)
    protected
        FItems: PtsLongintArray;
        FCount: Longint;
        FCapacity: Longint;

        procedure Assign(Source: TtsSortIntList); virtual;
        procedure CheckCapacity(NewSize: Longint); virtual;
        function  GetItem(Index: Longint): Longint; virtual;
        procedure SetItem(Index: Longint; Value: Longint);
        procedure Insert(Pos: Longint; Value: Longint); virtual;
        procedure Delete(Pos: Longint); virtual;
        procedure SetCapacity(Value: Longint); virtual;
        procedure FindPosition(Top, Bottom: Longint; CmpValue: Longint; var Pos: Longint; var Found: Boolean);

    public
        constructor Create;
        destructor Destroy; override;

        procedure Add(Value: Longint); virtual;
        function  Locate(Value: Longint; var Found: Boolean): Longint; virtual;
        procedure Remove(Value: Longint); virtual;

        property Item[Index: Longint]: Longint read GetItem write SetItem; default;
        property Count: Longint read FCount;
        property Capacity: Longint read FCapacity write SetCapacity;
    end;

    TtsIntegerSetList = class(TList)
    public
        destructor Destroy; override;

        procedure Assign(Source: TtsIntegerSetList); virtual;
        procedure AddItem(Item: TtsIntegerSet);
        procedure FreeItems;
        function  GetItem(Index: Integer): TtsIntegerSet;
        function  Remove(Value: TtsIntegerSet): Integer;
        procedure SetItem(Index: Integer; Value: TtsIntegerSet);

        property Item[Index : Integer] : TtsIntegerSet read GetItem write SetItem; default;
    end; //TtsIntegerSetList


function IntCompare(Int1, Int2: Pointer): Integer;


implementation

//******************************************************************************
//Implementation of class TtsSetNode

constructor TtsSetNode.CreatePtr(NodeValue : Pointer);
begin
    Initialize;
end;

procedure TtsSetNode.Initialize;
begin
    FBalance := 0;
    FLeft := nil;
    FRight := nil;
end;

destructor TtsSetNode.Destroy;
begin
    inherited Destroy;
end;

procedure TtsSetNode.Assign(Source: TtsSetNode);
begin
    FLeft := nil;
    FRight := nil;
    FBalance := Source.FBalance;
end;

function TtsSetNode.Release(DestroyingSet : Boolean) : Pointer;
begin
    Free;
    Result := nil;
end;

function TtsSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
{The compare method should compare NodeValue to the object itself. The method
 must be overridden.

 Return value:
    ordLarger if NodeValue is larger
    ordSmaller if NodeValue is smaller
    ordEqual if NodeValue is equal
}
begin
    Result := ordEqual;
end;

function TtsSetNode.CompareKey(NodeSet: TtsCustomSet; KeyValue : Pointer) : TtsSetOrder;
begin
    Result := Compare(NodeSet, KeyValue);
end;

function TtsSetNode.Value : Pointer;
begin
    Result := nil;
end;

//End implementation of class TtsSetNode
//******************************************************************************

//******************************************************************************
//Implementation of class TtsSetList

constructor TtsSetList.CreateCnt(NrOfElements : Longint);
begin
    Create;
    Initialize;

    if NrOfElements > 0 then
    begin
        FCount := NrOfElements;
        GetMem(FItems, FCount * SizeOf(Pointer));
    end;
end;

procedure TtsSetList.Initialize;
begin
    FCount := 0;
    FItems := nil;
end;

destructor TtsSetList.Destroy;
begin
    if FItems <> nil then FreeMem(FItems);
    inherited Destroy;
end;

procedure TtsSetList.SetItems(Index : Longint; Value : Pointer);
begin
    if (Index > 0) and (Index <= FCount) then
    begin
        FItems[Index] := Value;
    end;
end;

function TtsSetList.GetItems(Index : Longint) : Pointer;
begin
    if (Index > 0) and (Index <= FCount) then
        Result := FItems[Index]
    else
        Result := nil;
end;

//End implementation of class TtsSetList
//******************************************************************************


//******************************************************************************
//Implementation of class TtsNodeStack

constructor TtsNodeStack.Create;
begin
    inherited;
    FBuffer := nil;
    FBufSize := 0;
    FCount := 0;
end;

destructor TtsNodeStack.Destroy;
begin
    ReallocMem(FBuffer, 0);
    inherited;
end;

function TtsNodeStack.Push(Node: TtsSetNode; Direction: Shortint): Integer;
begin
    if FCount >= FBufSize then
    begin
        FBufSize := FCount + 10;
        ReallocMem(FBuffer, FBufSize * SizeOf(TtsNodeStackElement));
    end;

    Inc(FCount);
    FBuffer[FCount].Node := Node;
    FBuffer[FCount].Direction := Direction;
    Result := FCount;
end;

function TtsNodeStack.Pop: TtsNodeStackElement;
begin
    if Count > 0 then
    begin
        Result := FBuffer[FCount];
        Dec(FCount);
    end
    else
    begin
        Result.Node := nil;
        Result.Direction := 0;
    end;
end;

procedure TtsNodeStack.Replace(Index: Integer; Node: TtsSetNode; Direction: Shortint);
begin
    FBuffer[Index].Node := Node;
    FBuffer[Index].Direction := Direction;
end;

procedure TtsNodeStack.Reset;
begin
    FCount := 0;
end;

function TtsNodeStack.GetItem(Index: Integer): TtsNodeStackElement;
begin
    if (Index > 0) and (Index <= FCount) then
    begin
        Result := FBuffer[Index];
    end
    else
    begin
        Result.Node := nil;
        Result.Direction := 0;
    end;
end;

//End implementation of class TtsNodeStack
//******************************************************************************


//******************************************************************************
//Implementation of class TtsCustomSet

constructor TtsCustomSet.Create;
begin
    Initialize;
end;

procedure TtsCustomSet.Initialize;
begin
    FCount := 0;
    FTopNode := nil;
    FStack := TtsNodeStack.Create;
end;

destructor TtsCustomSet.Destroy;
begin
    DestroyNodes(FTopNode);
    FStack.Free;
    inherited Destroy;
end;

procedure TtsCustomSet.DestroyNodes(Tree : TtsSetNode);
begin
    if Tree <> nil then
    begin
        DestroyNodes(Tree.Left);
        DestroyNodes(Tree.Right);
        Tree.Release(true);
    end;
end;

procedure TtsCustomSet.Clear;
begin
    DestroyNodes(FTopNode);
    FTopNode := nil;
    FCount := 0;
    FStack.Reset;
end;

function TtsCustomSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsSetNode.CreatePtr(NodeValue);
end;

function TtsCustomSet.CopyNodes(Node: TtsSetNode): TtsSetNode;
begin
    if Node = nil then
        Result := nil
    else
    begin
        Result := GetNewNode(Node.Value);
        Result.Assign(Node);
        Result.Left := CopyNodes(Node.Left);
        Result.Right := CopyNodes(Node.Right);
    end;
end;

procedure TtsCustomSet.Assign(Source: TtsCustomSet);
begin
    Inc(FAssigning);
    try
        FTopNode := CopyNodes(Source.FTopNode);
    finally
        Dec(FAssigning);
    end;
end;

function TtsCustomSet.GetAssigning: Boolean;
begin
    Result := FAssigning <> 0;
end;

function TtsCustomSet.GetNewNode(NodeValue: Pointer): TtsSetNode;
var
    Node :TtsSetNode;
begin
    Node := NewNode(NodeValue);
    Node.FBalance := 0;
    FCount := FCount + 1;
    Result := Node;
end;

procedure TtsCustomSet.SearchNode(NodeValue: Pointer; var ParentNode, BalanceNode,
                                  NewNode: TtsSetNode; var Found: Boolean);
var
    Compare: TtsSetOrder;
    CurNode: TtsSetNode;
begin
    ParentNode := nil;
    CurNode := FTopNode;
    BalanceNode := FTopNode;

    NewNode := nil;
    Found := False;
    while True do
    begin
        Compare := CurNode.Compare(Self, NodeValue);
        case Compare of
            ordEqual: begin NewNode := CurNode; Found := True; Break; end;
            ordSmaller: NewNode := CurNode.Left;
            ordLarger:  NewNode := CurNode.Right;
        end;

        if NewNode = nil then
        begin
            NewNode := GetNewNode(NodeValue);
            if Compare = ordSmaller then CurNode.Left := NewNode
                                    else CurNode.Right := NewNode;
            Break;
        end;

        if NewNode.Balance <> 0 then
        begin
            ParentNode := CurNode;
            BalanceNode := NewNode;
        end;

        CurNode := NewNode;
    end;
end;

procedure TtsCustomSet.InsertSetBalance(NodeValue: Pointer; FromNode, ToNode: TtsSetNode);
var
    CurNode: TtsSetNode;
begin
    CurNode := FromNode;
    while CurNode <> ToNode do
    begin
        if CurNode.Compare(Self, NodeValue) = ordSmaller then
        begin
            CurNode.Balance := -1;
            CurNode := CurNode.Left;
        end
        else
        begin
            CurNode.Balance := 1;
            CurNode := CurNode.Right;
        end;
    end;
end;

procedure TtsCustomSet.RotateSingle(Direction: Shortint; var SubTopNode: TtsSetNode;
                                    BalanceNode, BalanceChildNode: TtsSetNode);
begin
    SubTopNode := BalanceChildNode;
    if Direction > 0 then
    begin
        BalanceNode.Right := BalanceChildNode.Left;
        BalanceChildNode.Left := BalanceNode;
    end
    else
    begin
        BalanceNode.Left := BalanceChildNode.Right;
        BalanceChildNode.Right := BalanceNode;
    end;

    if BalanceChildNode.Balance <> 0 then
    begin
        BalanceNode.Balance := 0;
        BalanceChildNode.Balance := 0;
    end
    else
    begin
        BalanceNode.Balance := Direction;
        BalanceChildNode.Balance := -Direction;
    end;
end;

procedure TtsCustomSet.RotateDouble(Direction: Shortint; var SubTopNode: TtsSetNode;
                                    BalanceNode, BalanceChildNode: TtsSetNode);
begin
    if Direction > 0 then
    begin
        SubTopNode := BalanceChildNode.Left;
        BalanceChildNode.Left := SubTopNode.Right;
        SubTopNode.Right := BalanceChildNode;
        BalanceNode.Right := SubTopNode.Left;
        SubTopNode.Left := BalanceNode;
    end
    else
    begin
        SubTopNode := BalanceChildNode.Right;
        BalanceChildNode.Right := SubTopNode.Left;
        SubTopNode.Left := BalanceChildNode;
        BalanceNode.Left := SubTopNode.Right;
        SubTopNode.Right := BalanceNode;
    end;

    if SubTopNode.Balance = Direction then
    begin
        BalanceNode.Balance := -Direction;
        BalanceChildNode.Balance := 0;
    end
    else if SubTopNode.Balance = 0 then
    begin
        BalanceNode.Balance := 0;
        BalanceChildNode.Balance := 0;
    end
    else if SubTopNode.Balance = -Direction then
    begin
        BalanceNode.Balance := 0;
        BalanceChildNode.Balance := Direction;
    end;

    SubTopNode.Balance := 0;
end;

procedure TtsCustomSet.InsertRebalance(Direction: Shortint; ParentNode, BalanceNode, BalanceChildNode: TtsSetNode);
var
    SubTopNode: TtsSetNode;
begin
    if BalanceNode.Balance = 0 then
    begin
        BalanceNode.Balance := Direction;
        Exit;
    end;

    if BalanceNode.Balance = -Direction then
    begin
        BalanceNode.Balance := 0;
        exit;
    end;

    if BalanceChildNode.Balance = Direction
        then RotateSingle(Direction, SubTopNode, BalanceNode, BalanceChildNode)
        else RotateDouble(Direction, SubTopNode, BalanceNode, BalanceChildNode);

    if ParentNode = nil then
        FTopNode := SubTopNode
    else
    begin
        if BalanceNode = ParentNode.Right
            then ParentNode.Right := SubTopNode
            else ParentNode.Left := SubTopNode;
    end;
end;

function TtsCustomSet.AddNode(NodeValue : Pointer) : TtsSetNode;
var
    Found: Boolean;
    ParentNode: TtsSetNode;
    NewNode, BalanceNode: TtsSetNode;
    BalanceChildNode: TtsSetNode;
    Compare: TtsSetOrder;
    Direction: Shortint;
begin
    if FTopNode = nil then
    begin
        FTopNode := GetNewNode(NodeValue);
        Result := FTopNode;
        Exit;
    end;

    SearchNode(NodeValue, ParentNode, BalanceNode, NewNode, Found);
    Result := NewNode;
    if Found then Exit;

    Compare := BalanceNode.Compare(Self, NodeValue);
    if Compare = ordSmaller then
    begin
        Direction := -1;
        BalanceChildNode := BalanceNode.Left
    end
    else
    begin
        Direction := 1;
        BalanceChildNode := BalanceNode.Right;
    end;

    InsertSetBalance(NodeValue, BalanceChildNode, NewNode);
    InsertRebalance(Direction, ParentNode, BalanceNode, BalanceChildNode);
end;

function TtsCustomSet.GetNode(Tree : TtsSetNode; NodeValue : Pointer) : TtsSetNode;
begin
    Result := nil;
    if Tree = nil then Exit;

    case Tree.CompareKey(Self, NodeValue) of
        ordEqual    : Result := Tree;
        ordSmaller  : Result := GetNode(Tree.Left, NodeValue);
        ordLarger   : Result := GetNode(Tree.Right, NodeValue);
    end;
end;

function TtsCustomSet.TraceElement(Value: Pointer): TtsSetNode;
var
    CurNode: TtsSetNode;
begin
    CurNode := FTopNode;
    while CurNode <> nil do
    begin
        case CurNode.CompareKey(Self, Value) of
            ordEqual: Break;
            ordSmaller: begin Stack.Push(CurNode, -1); CurNode := CurNode.Left; end;
            ordLarger: begin Stack.Push(CurNode, 1); CurNode := CurNode.Right; end;
        end;
    end;

    Result := CurNode;
end;

function TtsCustomSet.NextSmallestElement(Node: TtsSetNode): TtsSetNode;
var
    CurNode: TtsSetNode;
begin
    Stack.Push(Node, 1);
    CurNode := Node.Right;
    while CurNode.Left <> nil do
    begin
        Stack.Push(CurNode, -1);
        CurNode := CurNode.Left;
    end;

    Result := CurNode;
end;

procedure TtsCustomSet.DeleteNode(Node: TtsSetNode);
var
    NewNode: TtsSetNode;
begin
    if Node.Left = nil
        then NewNode := Node.Right
        else NewNode := Node.Left;

    if Stack.Count >= 1 then
    begin
        if Stack[Stack.Count].Direction = -1
            then Stack[Stack.Count].Node.Left := NewNode
            else Stack[Stack.Count].Node.Right := NewNode;
    end
    else
        FTopNode := NewNode;

    FCount := FCount - 1;
end;

procedure TtsCustomSet.RotateRebalance(var SubTopNode: TtsSetNode; var Done: Boolean);
var
    Direction: Shortint;
    BalanceNode, BalanceChildNode: TtsSetNode;
begin
    Done := False;
    with Stack do
    begin
        BalanceNode := Stack[Count].Node;
        if Stack[Count].Direction = -1 then
        begin
            BalanceChildNode := BalanceNode.Right;
            Direction := 1;
        end
        else
        begin
            BalanceChildNode := BalanceNode.Left;
            Direction := -1;
        end;
    end;

    if (BalanceChildNode.Balance = Direction) or (BalanceChildNode.Balance = 0) then
    begin
        Done := (BalanceChildNode.Balance = 0);
        RotateSingle(Direction, SubTopNode, BalanceNode, BalanceChildNode)
    end
    else
        RotateDouble(Direction, SubTopNode, BalanceNode, BalanceChildNode);
end;

procedure TtsCustomSet.RemoveRebalance;
var
    Done: Boolean;
    SubTopNode: TtsSetNode;
begin
    Done := False;
    with Stack do
    begin
        while (not Done) and (Count > 0) do
        begin
            if Stack[Count].Node.Balance = 0 then
            begin
                Stack[Count].Node.Balance := -Stack[Count].Direction;
                Break;
            end;

            if Stack[Count].Node.Balance = Stack[Count].Direction then
                Stack[Count].Node.Balance := 0
            else
            begin
                RotateRebalance(SubTopNode, Done);
                if Count = 1 then
                    FTopNode := SubTopNode
                else
                begin
                    if Stack[Count].Node = Stack[Count-1].Node.Right
                        then Stack[Count-1].Node.Right := SubTopNode
                        else Stack[Count-1].Node.Left := SubTopNode;
                end;
            end;

            Pop;
        end;
    end;
end;

procedure TtsCustomSet.ReplaceNode(ParentNode, Node, RplNode: TtsSetNode; StackPos: Integer);
begin
    if ParentNode = nil then
        FTopNode := RplNode
    else if ParentNode.Right = Node then
        ParentNode.Right := RplNode
    else
        ParentNode.Left := RplNode;

    RplNode.Left := Node.Left;
    RplNode.Right := Node.Right;
    RplNode.Balance := Node.Balance;

    if StackPos > 0 then
        Stack.Replace(StackPos, RplNode, Stack[StackPos].Direction);
end;

function TtsCustomSet.RemoveNode(Value: Pointer): TtsSetNode;
var
    ParentNode: TtsSetNode;
    Node, DelNode: TtsSetNode;
    NodeStackPos: Integer;
begin
    Stack.Reset;
    Node := TraceElement(Value);
    Result := Node;
    if Node = nil then Exit;

    ParentNode := nil;
    if Stack.Count >= 1 then ParentNode := Stack[Stack.Count].Node;

    NodeStackPos := 0;
    if (Node.Left <> nil) and (Node.Right <> nil) then
    begin
        NodeStackPos := Stack.Count + 1;
        DelNode := NextSmallestElement(Node);
    end
    else
        DelNode := Node;

    DeleteNode(DelNode);
    if Node <> DelNode then
        ReplaceNode(ParentNode, Node, DelNode, NodeStackPos);
    RemoveRebalance;
end;

function TtsCustomSet.TreeHeight(Node: TtsSetNode): Integer;
var
    LeftHeight, RightHeight: Integer;
begin
    Result := 0;
    if Node = nil then Exit;

    LeftHeight := TreeHeight(Node.Left);
    RightHeight := TreeHeight(Node.Right);
    if LeftHeight > RightHeight
        then Result := 1 + LeftHeight
        else Result := 1 + RightHeight;
end;

function TtsCustomSet.IsBalanced(Node: TtsSetNode): Boolean;
begin
    Result := True;
    if Node = nil then Exit;

    Result := IsBalanced(Node.Right) and
              IsBalanced(Node.Left) and
              (Abs(TreeHeight(Node.Left) - TreeHeight(Node.Right)) <= 1);
end;

function TtsCustomSet.CheckBalance: Boolean;
begin
    Result := IsBalanced(FTopNode);
end;

function TtsCustomSet.CheckHeight: Integer;
begin
    Result := TreeHeight(FTopNode);
end;

function TtsCustomSet.List : TtsSetList;
var
    ListPos : Longint;
    SetList : TtsSetList;
begin
    ListPos := 0;
    SetList := TtsSetList.CreateCnt(FCount);

    try
        PlaceTreeInList(FTopNode, SetList, ListPos)
    except
        on Exception do begin SetList.Free; raise end;
    end;

    Result := SetList;
end;

procedure TtsCustomSet.PlaceTreeInList(Node : TtsSetNode; SetList : TtsSetList; var ListPos : Longint);
begin
    if Node <> nil then
    begin
        PlaceTreeInList(Node.Left, SetList, ListPos);

        ListPos := ListPos + 1;
        SetList.Items[ListPos] := Node.Value;

        PlaceTreeInList(Node.Right, SetList, ListPos);
    end;
end;

//End implementation of class TtsCustomSet
//******************************************************************************


//******************************************************************************
//Implementation of class TtsStringSet

constructor TtsStringSetNode.Create(NodeValue : string);
begin
    inherited CreatePtr(@NodeValue);
    FNodeValue := NodeValue;
end;

function TtsStringSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
begin
    if FNodeValue = string(NodeValue^) then
        Result := ordEqual
    else if string(NodeValue^) < FNodeValue then
        Result := ordSmaller
    else
        Result := ordLarger
end;

function TtsStringSetNode.Value : Pointer;
begin
    Result := @FNodeValue;
end;

procedure TtsStringSetNode.Assign(Source: TtsSetNode);
begin
    if Source is TtsStringSetNode then
        FNodeValue := TtsStringSetNode(Source).FNodeValue;
end;

function TtsStringSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsStringSetNode.Create(string(NodeValue^));
end;

function TtsStringSet.Add(NodeValue : string) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := AddNode(@NodeValue);
    Result := @TtsStringSetNode(Node).FNodeValue;
end;

function TtsStringSet.Get(NodeValue : string) : Pointer;
var
    Node : TtsSetNode;
begin
    Result := nil;
    Node := GetNode(FTopNode, @NodeValue);
    if Node <> nil then Result := @TtsStringSetNode(Node).FNodeValue;
end;

function TtsStringSet.Remove(NodeValue : string) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := RemoveNode(@NodeValue);
    Node.Free;
    Result := nil;
end;

//End implementation of class TtsStringSet
//******************************************************************************


//******************************************************************************
//Implementation of class TtsVariantSet

constructor TtsVariantSetNode.Create(NodeValue : Variant);
begin
    inherited CreatePtr(@NodeValue);
    FNodeValue := NodeValue;
end;

function TtsVariantSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
begin
    if FNodeValue = Variant(NodeValue^) then
        Result := ordEqual
    else if Variant(NodeValue^) < FNodeValue then
        Result := ordSmaller
    else
        Result := ordLarger
end;

function TtsVariantSetNode.Value : Pointer;
begin
    Result := @FNodeValue;
end;

function TtsVariantSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsVariantSetNode.Create(Variant(NodeValue^));
end;

function TtsVariantSet.Add(NodeValue : Variant) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := AddNode(@NodeValue);
    Result := @TtsVariantSetNode(Node).FNodeValue;
end;

function TtsVariantSet.Get(NodeValue : Variant) : Pointer;
var
    Node : TtsSetNode;
begin
    Result := nil;
    Node := GetNode(FTopNode, @NodeValue);
    if Node <> nil then Result := @TtsVariantSetNode(Node).FNodeValue;
end;

function TtsVariantSet.Remove(NodeValue : Variant) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := RemoveNode(@NodeValue);
    Node.Free;
    Result := nil;
end;

//End implementation of class TtsVariantSet
//******************************************************************************


//******************************************************************************
//Implementation of class TtsIntegerSet

constructor TtsIntegerSetNode.Create(NodeValue : Longint);
begin
    inherited CreatePtr(@NodeValue);
    FNodeValue := NodeValue;
end;

function TtsIntegerSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
begin
    if FNodeValue = Longint(NodeValue^) then
        Result := ordEqual
    else if Longint(NodeValue^) < FNodeValue then
        Result := ordSmaller
    else
        Result := ordLarger
end;

function TtsIntegerSetNode.Value : Pointer;
begin
    Result := @FNodeValue;
end;

function TtsIntegerSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsIntegerSetNode.Create(Longint(NodeValue^));
end;

function TtsIntegerSet.Add(NodeValue : Longint) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := AddNode(@NodeValue);
    Result := @TtsIntegerSetNode(Node).FNodeValue;
end;

function TtsIntegerSet.Get(NodeValue : Longint) : Pointer;
var
    Node : TtsSetNode;
begin
    Result := nil;
    Node := GetNode(FTopNode, @NodeValue);
    if Node <> nil then Result := @TtsIntegerSetNode(Node).FNodeValue;
end;

function TtsIntegerSet.Remove(NodeValue : Longint) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := RemoveNode(@NodeValue);
    Node.Free;
    Result := nil;
end;

//End implementation of class TtsIntegerSet
//******************************************************************************


//******************************************************************************
//Implementation of class TtsRealSet

constructor TtsRealSetNode.Create(NodeValue : Double);
begin
    inherited CreatePtr(@NodeValue);
    FNodeValue := NodeValue;
end;

function TtsRealSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
begin
    if FNodeValue = Double(NodeValue^) then
        Result := ordEqual
    else if Double(NodeValue^) < FNodeValue then
        Result := ordSmaller
    else
        Result := ordLarger
end;

function TtsRealSetNode.Value : Pointer;
begin
    Result := @FNodeValue;
end;

function TtsRealSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsRealSetNode.Create(Double(NodeValue^));
end;

function TtsRealSet.Add(NodeValue : Double) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := AddNode(@NodeValue);
    Result := @TtsRealSetNode(Node).FNodeValue;
end;

function TtsRealSet.Get(NodeValue : Double) : Pointer;
var
    Node : TtsSetNode;
begin
    Result := nil;
    Node := GetNode(FTopNode, @NodeValue);
    if Node <> nil then Result := @TtsRealSetNode(Node).FNodeValue;
end;

function TtsRealSet.Remove(NodeValue : Double) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := RemoveNode(@NodeValue);
    Node.Free;
    Result := nil;
end;

//End implementation of class TtsRealSet
//******************************************************************************


//******************************************************************************
//Implementation of TtsObjectSet

function TtsSetElement.Compare(NodeSet: TtsCustomSet; Value : TtsSetElement) : TtsSetOrder;
{The compare method should compare Value to the object itself. The method must
 be overridden.

 Return value:
    ordLarger if Value is larger
    ordSmaller if Value is smaller
    ordEqual if Value is equal
}
begin
    Result := ordEqual;
end;

function TtsSetElement.CompareKey(NodeSet: TtsCustomSet; const KeyValue : array of const) : TtsSetOrder;
{The CompareKey method should compare the KeyValue to the key value of the
 object itself. The method must be overridden. KeyValue is an array of const, so
 it can consist of any number of elements.

 Parameters:
    KeyValue : contains the elements of the key, from KeyValue[0] to
               KeyValue[N-1].
 Return value:
    ordLarger if KeyValue is larger than the key of self
    ordSmaller if KeyValue is smaller then the key of self
    ordEqual if both are equal
}
begin
    Result := ordEqual;
end;

function TtsSetElement.Release(DestroyingSet : Boolean) : TtsSetElement;
{The Release method frees the TtsSetElement object when the element is removed
 from the set. The Release method can be overridden.

 Parameters:
    DestroyingSet : true if the object is being released as a result freeing
                    the entire set, otherwise false
 Return value :
    nil of the object is freed, otherwise a reference to the object.
}
begin
    Free;
    Result := nil;
end;

function TtsSetElement.Copy : TtsSetElement;
{A virtual method that returns a reference to the object that should be stored
 in the set. In the default implementation below, a reference to self is
 returned, which is the object that was passed to the Add method. Copy can be
 overridden to return a duplicate of this object rather than the object itself.
 In that case the set will contain duplicates and not the objects themselves.

 Return value:
    Reference to the object that will be stored in the set.
}
begin
    Result := Self;
end;

function TtsSetElement.AssignCopy: TtsSetElement;
{A virtual method that returns a reference to the object that should be stored
 in the set when it is being assigned to another set. In the default
 implementation below, a reference to self is returned, which is the object
 that was passed to the Add method. Copy can be overridden to return a duplicate
 of this object rather than the object itself. In that case the set will contain
 duplicates and not the objects themselves.

 Return value:
    Reference to the object that will be stored in the set.
}
begin
    Result := Self;
end;

function TtsSetElement.StringValue : string;
begin
    Result := '';
end;

constructor TtsObjectSetNode.Create(NodeValue : TtsSetElement);
begin
    inherited CreatePtr(NodeValue);
    FNodeValue := NodeValue.Copy;
end;

function TtsObjectSetNode.Compare(NodeSet: TtsCustomSet; NodeValue : Pointer) : TtsSetOrder;
begin
    Result := FNodeValue.Compare(NodeSet, TtsSetElement(NodeValue));
end;

function TtsObjectSetNode.CompareKey(NodeSet: TtsCustomSet; KeyValue : Pointer) : TtsSetOrder;
begin
    Result := FNodeValue.CompareKey(NodeSet, TtsVarRecArray(KeyValue^));
end;

function TtsObjectSetNode.Release(DestroyingSet : Boolean) : Pointer;
begin
    Result := FNodeValue.Release(DestroyingSet);
    inherited Release(DestroyingSet);
end;

function TtsObjectSetNode.Value : Pointer;
begin
    Result := FNodeValue;
end;

function TtsObjectSet.NewNode(NodeValue : Pointer) : TtsSetNode;
begin
    NewNode := TtsObjectSetNode.Create(TtsSetElement(NodeValue));
end;

function TtsObjectSet.Add(NodeValue : TtsSetElement) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := AddNode(NodeValue);

    if TtsObjectSetNode(Node).FNodeValue <> NodeValue then
    begin
        Result := TtsObjectSetNode(Node).FNodeValue.Release(false);
        TtsObjectSetNode(Node).FNodeValue := NodeValue.Copy;
    end
    else
    begin
        Result := nil;
    end;
end;

function TtsObjectSet.Get(KeyValue : array of const) : Pointer;
var
    Node : TtsSetNode;
begin
    Result := nil;
    Node := GetNode(FTopNode, @KeyValue);
    if Node <> nil then Result := TtsObjectSetNode(Node).FNodeValue;
end;

function TtsObjectSet.Remove(KeyValue : array of const) : Pointer;
var
    Node : TtsSetNode;
begin
    Node := RemoveNode(@KeyValue);
    if Node <> nil then Result := Node.Release(false)
                   else Result := nil;
end;

//End implementation of TtsObjectSet
//******************************************************************************


//******************************************************************************
//Implementation of TtsIntegerList

procedure TtsIntegerList.AddItem(Item: Integer);
begin
    Add(Pointer(Item));
end;

function TtsIntegerList.GetItem(Index: Integer): Integer;
begin
    Result := Integer(Items[Index]);
end;

procedure TtsIntegerList.SetItem(Index: Integer; Value: Integer);
begin
    Items[Index] := Pointer(Value);
end;

function TtsIntegerList.Remove(Value: Integer): Integer;
begin
    Result := inherited Remove(Pointer(Value));
end;

function IntCompare(Int1, Int2: Pointer): Integer;
begin
    Result := Integer(Int1) - Integer(Int2);
end;

//End implementation of TtsIntegerList
//******************************************************************************


//******************************************************************************
//Implementation of TtsIntegerSetList

destructor TtsIntegerSetList.Destroy;
begin
    FreeItems;
    inherited;
end;

procedure TtsIntegerSetList.FreeItems;
var
    I: Integer;
begin
    for I := 0 to Count - 1 do
    begin
        Item[I].Free;
        Item[I] := nil;
    end;
end;

procedure TtsIntegerSetList.Assign(Source: TtsIntegerSetList);
var
    I: Integer;
    MaxCount: Integer;
begin
    FreeItems;
    MaxCount := Count;
    if MaxCount > Source.Count then MaxCount := Source.Count;
    for I := 0 to MaxCount - 1 do
    begin
        if Assigned(Source.Item[I]) then
        begin
            Item[I] := TtsIntegerSet.Create;
            Item[I].Assign(Source.Item[I]);
        end;
    end;
end;

procedure TtsIntegerSetList.AddItem(Item: TtsIntegerSet);
begin
    Add(Pointer(Item));
end;

function TtsIntegerSetList.GetItem(Index: Integer): TtsIntegerSet;
begin
    Result := TtsIntegerSet(Items[Index]);
end;

procedure TtsIntegerSetList.SetItem(Index: Integer; Value: TtsIntegerSet);
begin
    Items[Index] := Pointer(Value);
end;

function TtsIntegerSetList.Remove(Value: TtsIntegerSet): Integer;
begin
    Result := inherited Remove(Pointer(Value));
end;

//Implementation of TtsIntegerSetList
//******************************************************************************


//******************************************************************************
//Implementation of TtsSortIntList

constructor TtsSortIntList.Create;
begin
    FItems := nil;
    FCount := 0;
    FCapacity := 0;
end;

destructor TtsSortIntList.Destroy;
begin
    ReallocMem(FItems, 0);
end;

procedure TtsSortIntList.Assign(Source: TtsSortIntList);
begin
    if (Source.FItems = nil) or (Source.FCount = 0) then
    begin
        ReAllocMem(FItems, 0);
        FCount := 0;
        FCapacity := 0;
    end
    else
    begin
        CheckCapacity(Source.FCount);
        CopyMemory(FItems, Source.FItems, (Source.Count + 1) * SizeOf(Longint));
        FCount := Source.FCount;
    end;
end;

procedure TtsSortIntList.CheckCapacity(NewSize: Longint);
begin
    if NewSize > Capacity then
        Capacity := NewSize + 100
    else if (NewSize < Capacity - 100) then
        Capacity := NewSize;
end;

procedure TtsSortIntList.SetCapacity(Value: Longint);
begin
    if FCapacity <> Value then
    begin
        FCapacity := Value;
        ReallocMem(FItems, (Value + 1) * SizeOf(Longint));
    end;
end;

function TtsSortIntList.GetItem(Index: Longint): Longint;
begin
    Result := 0;
    if (Index > 0) and (Index <= Count) then Result := FItems[Index];
end;

procedure TtsSortIntList.SetItem(Index: Longint; Value: Longint);
begin
    if (Index > 0) and (Index <= Count) then FItems[Index] := Value;
end;

procedure TtsSortIntList.Insert(Pos: Longint; Value: Longint);
begin
    CheckCapacity(Count + 1);
    if Pos = 0 then Inc(Pos);

    if Pos <= Count then
    begin
        MoveMemory(@FItems[Pos + 1], @FItems[Pos],
                   (Count - Pos + 1) * SizeOf(Longint));
    end;

    FItems[Pos] := Value;
    Inc(FCount);
end;

procedure TtsSortIntList.Delete(Pos: Longint);
begin
    if (Pos < 1) or (Pos > Count) then Exit;

    if Pos < Count then
    begin
        MoveMemory(@FItems[Pos], @FItems[Pos + 1],
                   (Count - Pos) * SizeOf(Longint));
    end;

    CheckCapacity(Count - 1);
    Dec(FCount);
end;

procedure TtsSortIntList.Add(Value: Longint);
var
    Pos: Longint;
    Found: Boolean;
begin
    Pos := Locate(Value, Found);
    if not Found then Insert(Pos, Value);
end;

procedure TtsSortIntList.Remove(Value: Longint);
var
    Pos: Longint;
    Found: Boolean;
begin
    Pos := Locate(Value, Found);
    if Found then Delete(Pos);
end;

procedure TtsSortIntList.FindPosition(Top, Bottom: Longint; CmpValue: Longint;
                                      var Pos: Longint; var Found: Boolean);
var
    Val: Longint;
begin
    if Top <= Bottom then
    begin
        Val := Item[(Top + Bottom) div 2];

        if Val > CmpValue then
            FindPosition(Top, ((Top + Bottom) div 2) - 1, CmpValue, Pos, Found)
        else if Val < CmpValue then
            FindPosition(((Top + Bottom) div 2) + 1, Bottom, CmpValue, Pos, Found)
        else
        begin
            Pos := (Top + Bottom) div 2;
            Found := True;
        end;
    end
    else if not Found then
        Pos := Top;
end;

function TtsSortIntList.Locate(Value: Longint; var Found: Boolean): Longint;
begin
    Result := 0;
    Found := False;
    FindPosition(1, Count, Value, Result, Found);
end;

//End implementation of TtsSortIntList
//******************************************************************************

end.

