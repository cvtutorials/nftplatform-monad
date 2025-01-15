// ... existing code ...
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HelloNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    // ... existing state variables ...

    uint256 private _tokenIdCounter;

    constructor(address _owner) ERC721("YourNFT", "YNFT") {
        owner = _owner;
        _tokenIdCounter = 0;
    }

    function mint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter += 1;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function batchMint(address to, string[] memory uris) public onlyOwner {
        for (uint256 i = 0; i < uris.length; i++) {
            mint(to, uris[i]);
        }
    }

    // Override required by Solidity for multiple inheritance
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    // Override required by Solidity for multiple inheritance
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    // ... existing functions ...
}