// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract MultiProofsTest is Test {
    bytes32[] leaves = [ bytes32(0xfa4859480aa6d899858de54334d2911e01c070df858de54334d2911e01c070df), bytes32(0x355069da35e598913d8736e5b8340527099960b83d8736e5b8340527099960b8), bytes32(0x7663893c3dc0850efc5391f5e5887ed723e51b83fc5391f5e5887ed723e51b83) ];

    bytes32 root = 0x9bc0c8d73b07d734720fa43b6849ef1cdab2565b48e3705473587da87b055ea6;
    bytes32[] proof0 = [ (2, bytes32(0x95bd95a9bcbd6db76c73e14ecde47f65d0e17a32cecf8a8213b8fd7a43475df1)), (56, bytes32(0xc246afd9bc6291ecc63bc55d86862031880bd8f7371c7577b327d0b477727961)), (135, bytes32(0xcc22ffc806c4d549da4e6309999bcdb4d08ec808d20a288b0106f4f70ec75940)) ];
    bytes32[] proof1 = [ (0, bytes32(0x22d40b6ffbaf81a4682a24c59e4efc93715d6ee21bddb4d797b91526369c8b3f)), (29, bytes32(0xa7493a81931ff691585c92cd84fefebda1636e148148af5da4cc1ca849c9d562)), (66, bytes32(0x010f5d2275f3a2226d2f2d795e816c6fe9b14e8d397315bb292943958824568d)) ];
    bytes32[] proof2 = [ (1, bytes32(0x3c6a09d9f2d31ed23a393a95f03fd4f6ea0b6a181b8f21d19c9f69117f9ff118)), (15, bytes32(0xc64e868704a6646b88e87424c08d926af3d92a698069a568a508fc3a4074297a)), (32, bytes32(0x90880c80c8dc3b03ce49f7306352b5bf78dc2a1e3e7fb80662d25632ba23e0b7)) ];
    bytes32[] proof3 = [ (1, bytes32(0x125f3f2840fc2efe872ebc90a12287360b8545bd27a4a531c57383e731bcc8e7)), (6, bytes32(0x5621c6d3424cf441777599cfb23c8b7dd8b5956894603d5df15f7376b11317e4)), (17, bytes32(0x78e04f9a45dc62c109c07687b06f1c49578bb32a75e56c0a74acfb02878aac1a)) ];
    bytes32[] proof4 = [ (1, bytes32(0x587ff23491bd611850951f5687cf01abd2f3d1fb7831abae7ce9dfc29a6f840e)), (2, bytes32(0xef089e23836b13724883695a231104ac9c5e0412dddd413a98b2feddf89e7481)), (9, bytes32(0xd288ecce4e19cd7bd34ab40b9df0a430e3f919236a2b9bd809bcd81d41635f4f)) ];
    bytes32[] proof5 = [ (5, bytes32(0x49d1ccb745f659094dec225df880fba864ae99e5082ae7a3d417da511ba5c2f3)) ];
    bytes32[] proof6 = [ (1, bytes32(0xc66c1da05d80ec9e72cc3bed4e600da7d688c7a7bde6c029749ecd9abe0a0c44)) ];
    bytes32[] proof7 = [  ];
    bytes32[] proof8 = [  ];
    bytes32[][] proofs = [ proof0, proof1, proof2, proof3, proof4, proof5, proof6, proof7, proof8 ];

    function testMultiProofs() public view {
        for (uint i = 0; i < leaves.length; ++i) {
            assert(MerkleProof.verify(proofs[i], root, keccak256(abi.encode(leaves[i]))));
        }
    }
}