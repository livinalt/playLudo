import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const PlayLudoModule = buildModule("PlayLudoModule", (m) => {

  const maxPlayer = 4;

  const playLudo = m.contract("PlayLudo", [maxPlayer]);

  return { playLudo };
});

export default PlayLudoModule;
