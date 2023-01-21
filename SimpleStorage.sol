// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    // This gets initialized to zero!
    // public makes favoriteNumber `visible`
    // The default visibility is `internal`
    // `public` variable implicitly get assigned a function that returns its value
    // favoriteNumber cached as a storage variable by default
    uint256 public favoriteNumber;

    // A mapping is a data struct where a key is mapped to a single value
    mapping(string => uint256) public nameToFavoriteNumber;
    

    // Dynamic array, size isn't given upon initialization
    // People[3] means max 3 people
    People[] public people;

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // since we don't need _name after this function runs, we store it as memory or calldata
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // virtual key word allows other contract to override
    function store(uint256 _favoriteNumber) public virtual {
        // The more computation you do in here, the greater the gas cost
        favoriteNumber = _favoriteNumber;
    }

    // view and pure funtions, when called alone, don't spend gas UNLESS called from inside a func that costs gas
    // view and pure functions disallow modification of state
    // pure functions additionally disallow you to read from blockchain state
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    struct People {
        uint256 favoriteNumber;
        string name;
    }
}