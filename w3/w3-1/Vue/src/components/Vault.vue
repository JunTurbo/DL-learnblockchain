<template>
  <div class="info">
    <p>我的地址：{{ address }}</p>
    <p>代币名字：{{ tokenName }}</p>
    <p>代币余额：{{ balance }} {{ tokenSymbol }}</p>
  </div>
</template>

<script>
import {ethers} from 'ethers'
import tokenAbi from '../assets/contract/TSToken.json'
import vaultAbi from '../assets/contract/Vault.json'

/* eslint-disable */
export default {
  name: 'Vault',
  data() {
    return {
      address: '',
      tokenName: '',
      balance: 0,
      tokenSymbol: '',
      vaultAddress: '0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0',
      tokenAddress: '0x5FbDB2315678afecb367f032d93F642f64180aa3'
    }
  },
  methods: {
    async initAccount() {
      if (window.ethereum) {
        console.log('initAccount')
        try {
          this.accounts = await window.ethereum.enable()
          console.log('accounts:' + this.accounts);
          this.address = this.accounts[0];
          this.currProvider = window.ethereum;
          this.provider = new ethers.providers.Web3Provider(window.ethereum);
          this.signer = this.provider.getSigner()
          let network = await this.provider.getNetwork()
          this.chainId = network.chainId
          console.log('chainId:', this.chainId)
          await this.initContract();
          await this.initInfo();
        } catch (error) {
          console.log('User denied account access', error)
        }
      } else {
        console.log('Need install MetaMask')
      }
    },

    async initContract() {
      this.erc20Token = new ethers.Contract(this.tokenAddress,
        tokenAbi, this.signer);

      this.vaultContract = new ethers.Contract(this.vaultAddress,
        vaultAbi.abi, this.signer);
    },
    async initInfo() {
      let a = this.erc20Token.symbol();

      // this.tokenSymbol = ;
      // this.tokenName = await this.erc20Token.name();
    }
  },
  created() {
    console.log('created')
    this.initAccount()
  }
}
</script>

<style scoped>

</style>
